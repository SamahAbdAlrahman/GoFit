import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class ProfitLineChart extends StatefulWidget {
  @override
  _ProfitLineChartState createState() => _ProfitLineChartState();
}

class _ProfitLineChartState extends State<ProfitLineChart> {
  List<SalesData> data = []; // Initialize an empty list to store profit data

  @override
  void initState() {
    super.initState();
   fetchData(); // Fetch profit data when the widget initializes
  }
  Future<int> fetchemployeeCountFromAPI() async {
    final response = await http.get(Uri.parse('http://192.168.111.1:3000/salary-sum')); // Replace with your API endpoint

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['sum'];
    } else {
      throw Exception('Failed to load user count');
    }
  }
  Future<int> fetchEmployeeCount() async {
    try {
      final count = await fetchemployeeCountFromAPI();
      print('employee count from the API: $count'); // Print the user count
      return count; // Return the user count as a string
    } catch (e) {
      print('Error fetching user count: $e'); // Print any errors
      // Handle errors if the API request fails, and return an appropriate string
      return 0; // Example: You can return 'Error' as a string in case of an error
    }
  }
  Future<double> fetchProfitByMonth(int month, int year) async {
    final String baseUrl = 'http://192.168.111.1:3000'; // Replace with your API base URL
    final String endpoint = '/subMoney'; // Replace with your endpoint
    final Uri uri = Uri.parse('$baseUrl$endpoint?month=$month&year=$year');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
print(jsonData['profit'].toDouble());
        return jsonData['profit'].toDouble();
      } else {
        throw Exception('Failed to load profit data');
      }
    } catch (e) {
      print('Error fetching profit data: $e');
      throw Exception('An error occurred while fetching profit data');
    }
  }
  Future<double> fetchmoneyByMonth(int month, int year) async {
    final String baseUrl = 'http://192.168.111.1:3000'; // Replace with your API base URL
    final String endpoint = '/money'; // Replace with your endpoint
    final Uri uri = Uri.parse('$baseUrl$endpoint?month=$month&year=$year');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData['profit'].toDouble());
        return jsonData['profit'].toDouble();
      } else {
        throw Exception('Failed to load profit data');
      }
    } catch (e) {
      print('Error fetching profit data: $e');
      throw Exception('An error occurred while fetching profit data');
    }
  }

  Future<void> fetchData() async {
    try {
      // Fetch profit data for each month and year you want to display
      // Example: Fetch profit data for January 2023
      final January1 = await fetchProfitByMonth(1, 2023);
      final January2 = await fetchmoneyByMonth(1, 2023);
      final January3 = await fetchEmployeeCount();

      final January=(January1+January2)+January3;
      final February1 = await fetchProfitByMonth(2, 2023);
      final February2 = await fetchmoneyByMonth(2, 2023);
      final February3 = await fetchEmployeeCount();
      final February=(February1+February2)-February3;

      final March1 = await fetchProfitByMonth(3, 2023);
      final March2 = await fetchmoneyByMonth(3, 2023);
      final March3 = await fetchEmployeeCount();
      final March=(March1+March2)-March3;

      final April1 = await fetchProfitByMonth(4, 2023);
      final April2 = await fetchmoneyByMonth(4, 2023);
      final April3 = await fetchEmployeeCount();
      final April=(April1+April2)-April3;

      final May1 = await fetchProfitByMonth(5, 2023);
      final May2 = await fetchmoneyByMonth(5, 2023);
      final May3 = await fetchEmployeeCount();
      final May=(May1+May2)-May3;

      final June1 = await fetchProfitByMonth(6, 2023);
      final June2 = await fetchmoneyByMonth(6, 2023);
      final June3 = await fetchEmployeeCount();
      final June=(June1+June2)-June3;

      final July1 = await fetchProfitByMonth(7, 2023);
      final July2 = await fetchmoneyByMonth(7, 2023);
      final July3 = await fetchEmployeeCount();
      final July=(July1+July2)-July3;

      final August1 = await fetchProfitByMonth(8, 2023);
      final August2 = await fetchmoneyByMonth(8, 2023);
      final August3 = await fetchEmployeeCount();
      final August=(August1+August2)-August3;

      final September1 = await fetchProfitByMonth(9, 2023);
      final September2 = await fetchmoneyByMonth(9, 2023);
      final September3 = await fetchEmployeeCount();
      final September=(September1+September2)-September3;

      final October1 = await fetchProfitByMonth(10, 2023);
      final October2 = await fetchmoneyByMonth(10, 2023);
      final October3 = await fetchEmployeeCount();
      final October=(October1+October2)-October3;

      final November1 = await fetchProfitByMonth(11, 2023);
      final November2 = await fetchmoneyByMonth(11, 2023);
      final November3 = await fetchEmployeeCount();
      final November=(November1+November2)-November3;

      final December1 = await fetchProfitByMonth(12, 2023);
      final December2= await fetchmoneyByMonth(12, 2023);
      final December3 = await fetchEmployeeCount();
      final December=(December1+December2)-December3;




      // Add the profit data to the 'data' list
      data.add(SalesData('Jan', January));
      data.add(SalesData('feb', February));
      data.add(SalesData('Mar',March ));
      data.add(SalesData('Apr',April ));
      data.add(SalesData('May',May ));
      data.add(SalesData('Jun', June));
      data.add(SalesData('Jul', July));
      data.add(SalesData('Aug',August ));
      data.add(SalesData('Sep', September));
      data.add(SalesData('Oct', October));
      data.add(SalesData('Nov',November ));
      data.add(SalesData('Dec', December));



      // Repeat the process for other months and years

      setState(() {});
    } catch (e) {
      print('Error fetching profit data: $e');
      // Handle errors if the API request fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: 'The monthly profit'),
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<SalesData, String>>[
            LineSeries<SalesData, String>(
              dataSource: data,
              xValueMapper: (SalesData sales, _) => sales.month,
              yValueMapper: (SalesData sales, _) => sales.sales,
              name: 'profit',
              dataLabelSettings: DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}
