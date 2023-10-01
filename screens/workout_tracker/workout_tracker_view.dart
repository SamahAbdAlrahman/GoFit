import 'package:gofit_frontend/common/colo_extension.dart';
import 'package:gofit_frontend/screens/workout_tracker/workour_detail_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:gofit_frontend/screens/main_tab/main_tab_view.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/upcoming_workout_row.dart';
import '../../common_widget/what_train_row.dart';

class WorkoutTrackerView extends StatefulWidget {
  const WorkoutTrackerView({super.key});

  @override
  State<WorkoutTrackerView> createState() => _WorkoutTrackerViewState();
}
class _WorkoutTrackerViewState extends State<WorkoutTrackerView> {

  List whatArr = [

    {
      "image": "assets/img/hg.png",
      "title": "Beginner Exercises",
      "exercises": "14 Exercises",
      "time": "20mins"
    },
    {
      // what_1.png
      "image": "assets/img/kk.png",
      "title": "Intermediate-Level Exercises",
      "exercises": "11 Exercises",
      "time": "32mins"
    },
    {
      "image": "assets/img/for.png",
      "title": "Advanced Exercises",
      "exercises": "14 Exercises",
      "time": "20mins"
    },
    {
      "image": "assets/img/yoga2.png",
      "title": "Yoga and Relaxation",
      "exercises": "12 Exercises",
      "time": "40mins"
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
                      itemCount: whatArr.length,
                      itemBuilder: (context, index) {
                        var wObj = whatArr[index] as Map? ?? {};
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  WorkoutDetailView( dObj: wObj, ) ));
                          },
                          child:  WhatTrainRow(wObj: wObj) );
                      }),
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

              ),
              // SizedBox(height: 45),

            ),

          ),

        ),
      ),
    );
  }


}
