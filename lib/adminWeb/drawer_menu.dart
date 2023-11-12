import 'package:flutter/material.dart';
import 'package:gofit_frontend/adminWeb/constants.dart';
import 'package:gofit_frontend/adminWeb/drawer_list_tile.dart';
import 'package:provider/provider.dart';

import '../Admin/edit pages.dart';
import '../Admin/newNutritionist.dart';
import '../Admin/new_coach.dart';
import 'SubTables.dart';
import 'Subscribtion-detailes.dart';
import 'controller.dart';
import 'dash_board_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40), // Adjust the radius as needed
          bottomRight: Radius.circular(40), // Adjust the radius as needed
        ),
    child: Drawer(
      backgroundColor: Colors.white,

      child: ListView(

        children: [

          Container(
            color: Colors.white,
            padding: EdgeInsets.all(50),
            child: Image.asset("assets/images/Gofit.svg"),
          ),
          DrawerListTile(
              title: 'DashBoard',
              svgSrc: 'assets/icons/Dashboard.svg',
              tap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (context) => Controller(),)
                  ],
                  child: DashBoardScreen(),
                ),));
              }),
          DrawerListTile(
              title: 'Edit Contain',
              svgSrc: 'assets/icons/edit.svg',
              tap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (context) => Controller(),)
                  ],
                  child: pages(),
                ),));
              }),


          DrawerListTile(
              title: 'messenger', svgSrc: 'assets/icons/Message.svg', tap: () {}),
          DrawerListTile(
              title: 'Add Coach',
              svgSrc: 'assets/icons/add.svg',
              tap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (context) => Controller(),)
                  ],
                  child: NewCoach(),
                ),));
              }),
          DrawerListTile(
              title: 'Add Nutritionist',
              svgSrc: 'assets/icons/add.svg',
              tap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (context) => Controller(),)
                  ],
                  child: newNutritionist(),
                ),));
              }),
          DrawerListTile(
              title: 'Gym information',
              svgSrc: 'assets/icons/info.svg',
              tap: () {}),
          DrawerListTile(
              title: 'Subscribtion Details',
              svgSrc: 'assets/icons/info.svg',
              tap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (context) => Controller(),)
                  ],
                  child: DashBoardScreen1(),
                ),));
              }),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),


          DrawerListTile(
              title: 'Logout',
              svgSrc: 'assets/icons/Logout.svg',
              tap: () {}),
        ],
      ),
    ),
    );
  }
}
