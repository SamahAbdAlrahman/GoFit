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

import 'BookingTable.dart';
import 'Subscribtion-detailes.dart';
import 'analytic_info_model.dart';
import 'discussions.dart';




import 'package:flutter/material.dart';
import 'package:gofit_frontend/adminWeb/constants.dart';
import 'package:gofit_frontend/adminWeb/responsive.dart';
import 'package:gofit_frontend/adminWeb/controller.dart';
import 'package:gofit_frontend/adminWeb/dashboard_content.dart';

import 'package:gofit_frontend/adminWeb/drawer_menu.dart';
import 'package:provider/provider.dart';

class DashBoardScreen1 extends StatelessWidget {
  const DashBoardScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      key: context.read<Controller>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) Expanded(child: DrawerMenu()),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFE9E9E9), Color(0xFFF6F6F6)],
                  ),
                ),
                child: subTable(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class subTable extends StatefulWidget {
  subTable({Key? key}) : super(key: key);

  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<subTable> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(appPadding),
        children: [
          CustomAppbar(),
          SizedBox(height: appPadding),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                // Web view: Show tables next to each other
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text('Booking Details', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45)),
                          SizedBox(height: appPadding),
                          bookingTable(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text('Subscription Details', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45)),
                          SizedBox(height: appPadding),
                          SubscriptionTable(),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                // Mobile view: Show tables above each other
                return Column(
                  children: [
                    Column(
                      children: [
                        Text('Booking Details', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45)),
                        SizedBox(height: appPadding),
                        bookingTable(),
                      ],
                    ),
                    Divider(height: 30, thickness: 3, color: Colors.white),
                    Column(
                      children: [
                        Text('Subscription Details', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45)),
                        SizedBox(height: appPadding),
                        SubscriptionTable(),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
