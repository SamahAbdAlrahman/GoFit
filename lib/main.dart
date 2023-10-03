import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/signup_screen.dart';
//

import 'package:gofit_frontend/screens/login/on_boarding_view.dart';
import 'package:gofit_frontend/screens/main_tab/select_view.dart';
import 'package:gofit_frontend/screens/main_tab/main_tab_view.dart';

import 'package:gofit_frontend/screens/meal_planner/meal_planner_view.dart';

import 'package:gofit_frontend/screens/workout_tracker/workout_tracker_view.dart';
import 'package:gofit_frontend/screens/workout_tracker/BeginnerExercises.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingView(),
      //  home: MealPlannerView(),
      // home: MainTabView(),
    );
  }
}
