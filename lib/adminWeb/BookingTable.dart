import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class bookingTable extends StatefulWidget {
  @override
  _bookingTableState createState() => _bookingTableState();
}

class _bookingTableState extends State<bookingTable> {
  List<Subscription> subscriptions = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch booking data when the widget initializes.
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.111.1:3000/fetchUserbook'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        // Convert the JSON data into Subscription objects
        final List<Subscription> fetchedSubscriptions = jsonData.map((data) {
          return Subscription(
            username: data['username'] ?? 'N/A',
            className: data['className'] ?? 'N/A',
            cost: data['cost'] ?? 'N/A',
            date: data['date'] != null ? DateTime.parse(data['date']) : DateTime.now(),
            time: data['time'] ?? 'N/A',
            coachName: data['coachName'] ?? 'N/A',
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
              color: Colors.grey.withOpacity(0.6), // Set shadow color and opacity
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
                  label: Text('class name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Cost', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Time', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Coach Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ],
              rows: subscriptions.asMap().entries.map((entry) {
                //final index = entry.key;
                final subscription = entry.value;
                final dateFormatter = DateFormat('dd-MM-yy');
                final startDateFormatted = dateFormatter.format(subscription.date);

                return DataRow(
                  color: MaterialStateProperty.all<Color>( Colors.white), // Set row background color
                  cells: [
                    DataCell(Text(subscription.username)),
                    DataCell(Text(subscription.className)),
                    DataCell(Text(subscription.cost)),
                    DataCell(Text(startDateFormatted)),
                    DataCell(Text(subscription.time)),
                    DataCell(Text(subscription.coachName)),
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
  final String className;
  final String cost;
  final DateTime date;
  final String time;
  final String coachName;

  Subscription({
    required this.username,
    required this.className,
    required this.cost,
    required this.date,
    required this.time,
    required this.coachName,
  });
}
