import 'package:gofit_frontend/common/colo_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gofit_frontend/screens/main_tab/main_tab_view.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/upcoming_workout_row.dart';
import '../../common_widget/what_train_row.dart';
import 'package:gofit_frontend/screens/workout_tracker/BeginnerExercises.dart';
import 'package:gofit_frontend/screens/workout_tracker/IntermediateExercises.dart';
import 'package:gofit_frontend/screens/workout_tracker/AdvancedExercises.dart';
import 'package:gofit_frontend/screens/workout_tracker/yoga.dart';

class WorkoutTrackerView extends StatefulWidget {
  // const WorkoutTrackerView({super.key});
  const WorkoutTrackerView();
  @override
  State<WorkoutTrackerView> createState() => _WorkoutTrackerViewState();
}
class _WorkoutTrackerViewState extends State<WorkoutTrackerView> {

  List Exerc = [

    {
      "image": "assets/img/hg.png",
      "title": "Beginner Exercises",
    },
    {
      // what_1.png
      "image": "assets/img/kk.png",
      "title": "Intermediate-Level Exercises",
    },
    {
      "image": "assets/img/for.png",
      "title": "Advanced Exercises",
    },
    {
      "image": "assets/img/yoga2.png",
      "title": "Yoga and Relaxation",
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
            Color.fromRGBO(48, 58, 30, 1.0),
            Color.fromRGBO(56, 87, 4, 0.81),
            Color.fromRGBO(56, 87, 4, 0.750),
            Color.fromRGBO(56, 87, 4, 0.5019607843137255),
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
                "Gymnastics",
                style: TextStyle(color: Colors.white, fontSize: 35),
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
                        "What Do You Want to Train ?",
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
                            builder: (context) => BeginnerExercises(),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IntermediateExercises(),
                          ),
                        );
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdvancedExercises(),
                          ),
                        );
                      }else if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => YogaExercises(),
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
                  Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: media.width * 0.08,
                            ),
                            // ... other widgets ...

                            // Remove the Positioned widget from here

                          ],
                        ),
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

                ],

              ),
              // SizedBox(height: 45),

            ),

          ),

        ),
      ),
    );
  }


}
