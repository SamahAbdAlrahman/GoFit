import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class SubscriptionTable extends StatefulWidget {
  @override
  _SubscriptionTableState createState() => _SubscriptionTableState();
}

class _SubscriptionTableState extends State<SubscriptionTable> {
  List<Subscription> subscriptions = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch subscription data when the widget initializes.
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.111.1:3000/fetchUserSub'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        // Convert the JSON data into Subscription objects
        final List<Subscription> fetchedSubscriptions = jsonData.map((data) {
          return Subscription(
            username: data['username'],
            startDate: DateTime.parse(data['startDate']),
            endDate: DateTime.parse(data['endDate']),
            price: data['price'],
            month: data['month'],
          );
        }).toList();

        setState(() {
          subscriptions = fetchedSubscriptions;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      // Handle errors if the API request fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10), // Set border radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4), // Set shadow color and opacity
              spreadRadius: 2, // Spread radius
              blurRadius: 3, // Blur radius
              offset: Offset(0, 3), // Offset of the shadow
            ),
          ],
        ),
        child: Column(
          children: [

            DataTable(
              headingRowHeight: 40,
              dataRowHeight: 50,
              columnSpacing: 16,
              headingRowColor: MaterialStateProperty.all<Color>(Colors.deepOrange), // Set heading row background color
              columns: [
                DataColumn(
                  label: Text('Subscriber name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Start Date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                DataColumn(
                  label: Text('End Date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Price', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Month', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ],
              rows: subscriptions.asMap().entries.map((entry) {
                final index = entry.key;
                final subscription = entry.value;
                final dateFormatter = DateFormat('dd-MM-yy');
                final startDateFormatted = dateFormatter.format(subscription.startDate);
                final endDateFormatted = dateFormatter.format(subscription.endDate);

                return DataRow(
                  color: MaterialStateProperty.all<Color>( Colors.white), // Set row background color
                  cells: [
                    DataCell(Text(subscription.username)),
                    DataCell(Text(startDateFormatted)),
                    DataCell(Text(endDateFormatted)),
                    DataCell(Text(subscription.price)),
                    DataCell(Text(subscription.month)),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Subscription {
  final String username;
  final DateTime startDate;
  final DateTime endDate;
  final String price;
  final String month;

  Subscription({
    required this.username,
    required this.startDate,
    required this.endDate,
    required this.price,
    required this.month,
  });
}
