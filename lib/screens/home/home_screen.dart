import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gofit_frontend/BMI/BMIHome.dart';
import 'package:gofit_frontend/screens/User/ExcerciseClasses.dart';
import 'package:gofit_frontend/screens/User/bookingOption.dart';
import 'package:gofit_frontend/screens/User/subscribtion.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Profile/MainProfile.dart';
import '../../Profile/ProfileScreen.dart';
import '../../BMR/BMRHome.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    // to get size
    var size = MediaQuery.of(context).size;


    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
           // height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/top.png')),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                          ],
                        ),
                        SizedBox(width: 230,),
                        IconButton(
                          icon: Icon(Icons.notifications,color: Colors.white), // Add your notification icon here
                          onPressed: () {
                            // Handle notification icon press
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.messenger,color: Colors.white), // Add your notification icon here
                          onPressed: () {
                            // Handle notification icon press
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                             Image.asset( "assets/img/excercise.png",height: 130,),
                            //  SizedBox(height: 15,),

                              Text(
                                'Exercises',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the desired page when this card is tapped
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    // Replace 'YourDestinationScreen' with the screen you want to navigate to
                                    return SportsLessonsPage();
                                  },
                                ),
                              );
                            },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/img/book1.png",height: 135,),
                              //SizedBox(height: 15,),

                              Text(
                                'Booking Class',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/img/meal plan.png",height: 130,),
                             // SizedBox(height: 15,),

                              Text(
                                'Meal Plan',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the desired page when this card is tapped
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    // Replace 'YourDestinationScreen' with the screen you want to navigate to
                                    return GymSubscriptionScreen();
                                  },
                                ),
                              );
                            },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/img/book.png",height: 130,),
                              //SizedBox(height: 15,),
                              Text(
                                'Gym Subscribtion',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                             Image.asset("assets/img/alarm.png",height: 100,),
                              Text(
                                'Water drink alarm',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the desired page when this card is tapped
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    // Replace 'YourDestinationScreen' with the screen you want to navigate to
                                    return BMI();
                                  },
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/img/BMI.png",height: 135,),
                                //SizedBox(height: 15,),

                                Text(
                                  'BMI Calculater',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the desired page when this card is tapped
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    // Replace 'YourDestinationScreen' with the screen you want to navigate to
                                    return HomeScreenBMR();
                                  },
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/img/calu.jpg",height: 135,),
                                //SizedBox(height: 15,),

                                Text(
                                  'BMR Calculater',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),


    );
  }
}
