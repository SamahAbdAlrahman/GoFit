import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gofit_frontend/adminWeb/constants.dart';
import 'package:gofit_frontend/adminWeb/responsive.dart';
import 'package:gofit_frontend/adminWeb/analytic_cards.dart';
import 'package:gofit_frontend/adminWeb/custom_appbar.dart';
import 'package:gofit_frontend/adminWeb/top_referals.dart';
import 'package:gofit_frontend/adminWeb/users_by_device.dart';
import 'package:gofit_frontend/adminWeb/viewers.dart';
import 'package:gofit_frontend/adminWeb/users.dart';
import 'package:gofit_frontend/adminWeb/users_by_device.dart';
import 'package:gofit_frontend/adminWeb/viewers.dart';
import 'package:http/http.dart' as http;

import 'analytic_info_model.dart';
import 'discussions.dart';

class DashboardContent extends StatefulWidget {
  DashboardContent({Key? key}) : super(key: key);

  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
 // Initialize the userCount to an empty string

  Future<int> fetchUserCountFromAPI() async {
    final response = await http.get(Uri.parse('http://192.168.111.1:3000/users/count')); // Replace with your API endpoint

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['count'];
    } else {
      throw Exception('Failed to load user count');
    }
  }
  Future<int> fetchemployeeCountFromAPI() async {
    final response = await http.get(Uri.parse('http://192.168.111.1:3000/employee/count')); // Replace with your API endpoint

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['count'];
    } else {
      throw Exception('Failed to load user count');
    }
  }
  Future<int> fetchsubCountFromAPI() async {
    final response = await http.get(Uri.parse('http://192.168.111.1:3000/subCount')); // Replace with your API endpoint

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['count'];
    } else {
      throw Exception('Failed to load user count');
    }
  }
  Future<int> fetchEmployeeCount() async {
    try {
      final count = await fetchemployeeCountFromAPI();
      print('User count from the API: $count'); // Print the user count
      return count; // Return the user count as a string
    } catch (e) {
      print('Error fetching user count: $e'); // Print any errors
      // Handle errors if the API request fails, and return an appropriate string
      return 0; // Example: You can return 'Error' as a string in case of an error
    }
  }
  Future<int> fetchUserCount() async {
    try {
      final count = await fetchUserCountFromAPI();
      print('User count from the API: $count'); // Print the user count
      return count; // Return the user count as a string
    } catch (e) {
      print('Error fetching user count: $e'); // Print any errors
      // Handle errors if the API request fails, and return an appropriate string
      return 0; // Example: You can return 'Error' as a string in case of an error
    }
  }
  Future<int> fetchSubCount() async {
    try {
      final count = await fetchsubCountFromAPI();
      print('User count from the API: $count'); // Print the user count
      return count; // Return the user count as a string
    } catch (e) {
      print('Error fetching user count: $e'); // Print any errors
      // Handle errors if the API request fails, and return an appropriate string
      return 0; // Example: You can return 'Error' as a string in case of an error
    }
  }
  num Count = 0; // Initialize the userCount to an empty string
  num Sub = 0;

  num employee = 0; // Initialize the userCount to an empty string
// Initialize the userCount to an empty string


  void _loadUserCount() async {
    num result = await fetchUserCount();
    setState(() {
      Count = result;
    });
    _buildAnalyticData(); // After fetching user count, build the analyticData list
  }
  void _loadEmployeeCount() async {
    num result = await fetchEmployeeCount();
    setState(() {
      employee = result;
    });
    _buildAnalyticData(); // After fetching user count, build the analyticData list
  }
  void _loadsubCount() async {
    num result = await fetchSubCount();
    setState(() {
      Sub = result;
    });
    _buildAnalyticData(); // After fetching user count, build the analyticData list
  }
  double calculateSubscriberPercentage() {
    if (Count == 0) {
      return 0.0; // To avoid division by zero
    }
    double result= (Sub / Count) * 100;
    print ('persentage${result}');
    return (Sub / Count) * 100;
  }
  List<AnalyticInfo> analyticData = []; // Initialize as an empty list

  void _buildAnalyticData() {
    analyticData = [
      AnalyticInfo(
        title: "Users",
        count: Count,
        svgSrc: "assets/icons/Subscribers.svg",
        color: primaryColor,
      ),
      AnalyticInfo(
        title: "Subscribers",
        count: Sub,
        svgSrc: "assets/icons/Subscribers.svg",
        color: purple,
      ),
      AnalyticInfo(
        title: "Employees",
        count: employee,
        svgSrc: "assets/icons/Subscribers.svg",
        color: orange,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _loadUserCount();
    _loadsubCount();
    _loadEmployeeCount();
  }

  @override
  Widget build(BuildContext context) {
    double subscriberPercentage = calculateSubscriberPercentage();

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(appPadding),
        child: Column(
          children: [
            CustomAppbar(),
            SizedBox(
              height: appPadding,
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          AnalyticCards(analyticData: analyticData),
                          SizedBox(
                            height: appPadding,
                          ),
                          Users(),
                          if (Responsive.isMobile(context))
                            SizedBox(
                              height: appPadding,
                            ),
                          if (Responsive.isMobile(context)) Discussions(),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(
                        width: appPadding,
                      ),
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: Discussions(),
                      ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: appPadding,
                          ),
                          Row(
                            children: [

                              if (!Responsive.isMobile(context))
                                SizedBox(
                                  width: appPadding,
                                ),
                              Expanded(
                                flex: 3,
                                child: Viewers(),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          SizedBox(
                            height: appPadding,
                          ),
                          if (Responsive.isMobile(context))
                            SizedBox(
                              height: appPadding,
                            ),
                          if (Responsive.isMobile(context))
                            SizedBox(
                              height: appPadding,
                            ),
                          if (Responsive.isMobile(context)) UsersByDevice(subscriberPercentage:subscriberPercentage,),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(
                        width: appPadding,
                      ),
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: UsersByDevice(subscriberPercentage:subscriberPercentage,),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
