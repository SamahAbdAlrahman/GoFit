import 'package:flutter/material.dart';
import 'package:gofit_frontend/adminWeb/constants.dart';
import 'package:gofit_frontend/adminWeb/responsive.dart';
import 'package:gofit_frontend/adminWeb/controller.dart';
import 'package:gofit_frontend/adminWeb/dashboard_content.dart';

import 'package:gofit_frontend/adminWeb/drawer_menu.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

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
                child: DashboardContent(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
