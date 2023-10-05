import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _MenuViewState();
}

class _MenuViewState extends State<drawer> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('ameera'), // Replace with user's name
              accountEmail: Text('ameera@example.com'), // Replace with user's email
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/1.png'), // Provide your image path
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Color.fromRGBO(248, 96, 2, 1.0),
                    Color.fromRGBO(201, 79, 57, 1.0),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle the Home menu item tap
                Navigator.pop(context); // Close the drawer
                // Implement the navigation logic to your Home screen
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Profile'),
              onTap: () {
                // Handle the Settings menu item tap
                Navigator.pop(context); // Close the drawer
                // Implement the navigation logic to your Settings screen
              },
            ),

            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('notifications'),
              onTap: () {
                // Handle the Home menu item tap
                Navigator.pop(context); // Close the drawer
                // Implement the navigation logic to your Home screen
              },
            ),
            ListTile(
              leading: Icon(Icons.messenger),
              title: Text('chat'),
              onTap: () {
                // Handle the Home menu item tap
                Navigator.pop(context); // Close the drawer
                // Implement the navigation logic to your Home screen
              },
            ),
            // Add more ListTile widgets for additional menu items
          ],
        ),

      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: media.width * 0.6,
              collapsedHeight: kToolbarHeight + 20,
              flexibleSpace: Stack(
                alignment: Alignment.bottomLeft,
                children: [


                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,

                        colors: [
                          // Color.fromRGBO(238, 227, 227, 1.0),
                          Color.fromRGBO(248, 96, 2, 1.0),
                          Color.fromRGBO(190, 57, 33, 1.0)
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 15),

                        Padding(
                          padding: EdgeInsets.all(40),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[



                              Text(
                                "Home page",
                                style: TextStyle(color: Colors.white, fontSize:22 , fontWeight: FontWeight.w300 ,fontFamily: 'LibreBaskerville'),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 5),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(300),
                              ),
                            ),





                          ),
                        ),
                      ],
                    ),

                  ),
                ],
              ),
            )
          ];
        },
       body:ListBody()

      ),
    );
  }
}

class TColor {
  static  Color get primary => const Color(0xffFF9B70);

  static Color get primaryText => const Color(0xff221E3A);
  static Color get secondaryText => const Color(0xff707070);
  static Color get green=> const Color(0xff77E517);

  static Color get white => Colors.white;
  static Color get gray => const Color(0xff8C8C8C);
  static Color get divider => const Color(0xffE1E1E1);

}