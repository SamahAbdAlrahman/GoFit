import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Notification {
  final String title;
  final String username;
  final DateTime startDate;
  final DateTime endDate;
  bool isRead;

  Notification(this.title, this.username, this.startDate, this.endDate, this.isRead);
}
List<Notification> notifications = []; // Define the notifications list

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    final apiUrl = Uri.parse("http://192.168.111.1:3000/getadminNotification");
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Notification> fetchedNotifications = [];

      for (var item in data) {
        final isRead = item['isRead'] ?? false;
        fetchedNotifications.add(Notification(
          item['title'],
          item['username'],
          DateTime.parse(item['startDate']),
          DateTime.parse(item['endDate']),
          isRead,
        ));
      }
      setState(() {
        notifications = fetchedNotifications;
      });
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  void markNotificationAsRead(int index) {
    setState(() {
      notifications[index].isRead = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Notifications'),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationCard(
            notification: notification,
            markAsRead: markNotificationAsRead,
          );
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final Notification notification;
  final Function(int) markAsRead;

  NotificationCard({required this.notification, required this.markAsRead});

  void _markAsRead() {
    if (!notification.isRead) {
      markAsRead(notifications.indexOf(notification));
      notification.isRead = true; // تحديث حالة الإشعار
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _markAsRead,
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  ' ${notification.username} subscribe to gym ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  'From: ${DateFormat('dd-MM-yyyy').format(notification.startDate)} to ${DateFormat('dd-MM-yyyy').format(notification.endDate)}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                if (!notification.isRead)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'New',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
