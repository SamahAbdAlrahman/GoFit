
import 'package:flutter/material.dart';
import 'package:gofit_frontend/screens/main_tab/main_tab_view.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/upcoming_workout_row.dart';
import '../../common_widget/what_train_row.dart';
import 'package:gofit_frontend/screens/meal_planner/Breakfast.dart';
import 'package:gofit_frontend/screens/meal_planner/Dinner.dart';
import 'package:gofit_frontend/screens/meal_planner/Lunch.dart';
import 'package:gofit_frontend/screens/meal_planner/Snacks.dart';


class MealPlannerView extends StatefulWidget {
  @override
  _MealPlannerViewState createState() => _MealPlannerViewState();
}

class _MealPlannerViewState extends State<MealPlannerView> {
  List Exerc = [

    {
      "title": "Breakfast",
      "image": "assets/img/foo2.png",
      // "image": "assets/img/fooo.png",
      // "image": "assets/img/fo3.png",
    },
    {"title": "Lunch",
      "image": "assets/img/foo2.png",
      // "image": "assets/img/f95.png",
      // "image": "assets/img/fo3.png",
      // "image": "assets/img/fooo.png",
    },
    {"title": "Dinner",
      "image": "assets/img/foo2.png",
      // "image": "assets/img/fooo.png",
      // "image": "assets/img/fo3.png",
    },

    {"title": "Snacks",
      "image": "assets/img/foo2.png",
      // "image": "assets/img/orange.png",
      // "image": "assets/img/fo3.png",
      // "image": "assets/img/f94.png",
      // "image": "assets/img/fooo.png",
    },



  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            Color.fromRGBO(12, 10, 10, 1.0),
            Color.fromRGBO(66, 11, 86, 0.90),
          ],
        ),
      ),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
            ),
            SliverAppBar(
              backgroundColor: Colors.transparent,

              title: Text(
                "Meal Plans",
                style: TextStyle(color: Colors.white, fontSize: 35 , fontWeight: FontWeight.w400),
              ),
            ),
/////////////////////////////////////////////////////


          ];
        },



        //************************************************************************************************************
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),

          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: media.width * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "What Do You Want to Eat ?",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 19,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      var wObj = Exerc[index] as Map? ?? {};
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the respective screen based on the index
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Breakfast(),
                              ),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Lunch(),
                              ),
                            );
                          } else if (index == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Dinner(),
                              ),
                            );
                          }else if (index == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Snacks(),
                              ),
                            );
                          }
                        },
                        child: WhatTrainRow(wObj: wObj),
                      );
                    },
                  ),

                  SizedBox(
                    height: media.width * 0.1,
                  ),

                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainTabView(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/img/goBackIcone.png',
                            width: 28,
                            height: 28,
                          ),
                        ),
                      ),
                    ],
                  )



              ),
              // SizedBox(height: 45),

            ),

          ),

        ),

    );
  }


}
