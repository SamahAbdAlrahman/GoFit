import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gofit_frontend/adminWeb/constants.dart';
import 'package:gofit_frontend/adminWeb/analytic_info_model.dart';
import 'package:gofit_frontend/adminWeb/referal_info_model.dart';

class UserCountFetcher extends StatefulWidget {
  @override
  _UserCountFetcherState createState() => _UserCountFetcherState();
}

class _UserCountFetcherState extends State<UserCountFetcher> {
  String userCount = 'Loading...';

  Future<void> fetchUserCount() async {
    final response = await http.get(Uri.parse('http://192.168.111.1:3000/users/count')); // Replace with your Node.js API endpoint

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final count = jsonData['count'];
      setState(() {
        userCount = count.toString();
      });
    } else {
      setState(() {
        userCount = 'Failed to load data';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserCount();
  }

  @override
  Widget build(BuildContext context) {
    // Define and initialize the lists here with the userCount value



    List<ReferalInfoModel> referalData = [
      ReferalInfoModel(
        title: "Facebook",
        count: 234,
        svgSrc: "assets/icons/Facebook.svg",
        color: primaryColor,
      ),
      ReferalInfoModel(
        title: "Twitter",
        count: 234,
        svgSrc: "assets/icons/Twitter.svg",
        color: primaryColor,
      ),
      ReferalInfoModel(
        title: "Linkedin",
        count: 234,
        svgSrc: "assets/icons/Linkedin.svg",
        color: primaryColor,
      ),
      ReferalInfoModel(
        title: "Dribble",
        count: 234,
        svgSrc: "assets/icons/Dribbble.svg",
        color: red,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('User Count'),
      ),
      body: Center(
        child: Text('Number of Users: $userCount'),
      ),
    );
  }
}
