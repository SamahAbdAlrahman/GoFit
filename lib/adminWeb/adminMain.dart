import 'package:flutter/material.dart';
import 'package:gofit_frontend/screens/User/search.dart';
//import 'package:gofit_frontend/explore.dart';
import 'package:gofit_frontend/screens2/search_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gofit_frontend/screens/main_tab/select_view.dart';
import 'package:gofit_frontend/screens/main_tab/main_tab_view.dart';
import 'package:provider/provider.dart';

import 'package:gofit_frontend/screens/meal_planner/meal_planner_view.dart';
import 'package:gofit_frontend/Admin/admin.dart';
//import 'EditExcerciseClasses.dartExcerciseClasses.dart';
import 'package:gofit_frontend/screens/workout_tracker/workout_tracker_view.dart';
//import 'package:gofit_frontend/screens/workout_tracker/BeginnerExercises.dart';
import 'package:gofit_frontend/screens/login/on_boarding_view.dart';
import 'package:gofit_frontend/screens/home/menu_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gofit_frontend/adminWeb/controller.dart';
import 'package:gofit_frontend/adminWeb/dash_board_screen.dart';


class adminMain extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Controller(),)
        ],
        child: DashBoardScreen(),
      ),
    );
  }
}
