import 'package:flutter/material.dart';
import 'package:gofit_frontend/screens/User/ExcerciseClasses.dart';
import 'package:gofit_frontend/screens/User/paymenthome.dart';
import 'package:gofit_frontend/screens/User/search.dart';
import 'package:gofit_frontend/screens/User/subscribtion.dart';
import 'package:gofit_frontend/BMR/BMRHome.dart';
//import 'package:gofit_frontend/explore.dart';
import 'package:gofit_frontend/screens2/search_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Admin/EditExcerciseClasses.dart';
import 'Admin/adminPanel.dart';
import 'Admin/editAdvancedExercises.dart';
import 'Admin/new_coach.dart';
import 'Blog/comment.dart';
import 'adminWeb/adminMain.dart';
import 'coach/MenuCoach.dart';
import 'BMI/BMIHome.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/signup_screen.dart';
import 'package:gofit_frontend/screens/main_tab/select_view.dart';
import 'package:gofit_frontend/screens/main_tab/main_tab_view.dart';
import 'package:provider/provider.dart';

import 'package:gofit_frontend/screens/meal_planner/meal_planner_view.dart';
import 'package:gofit_frontend/Admin/admin.dart';
import 'screens/User/bookingOption.dart';
//import 'EditExcerciseClasses.dartExcerciseClasses.dart';
import 'package:gofit_frontend/screens/workout_tracker/workout_tracker_view.dart';
//import 'package:gofit_frontend/screens/workout_tracker/BeginnerExercises.dart';
import 'package:gofit_frontend/screens/login/on_boarding_view.dart';
import 'package:gofit_frontend/screens/home/menu_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gofit_frontend/adminWeb/controller.dart';
import 'package:gofit_frontend/adminWeb/dash_board_screen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
 // WidgetsFlutterBinding.ensureInitialized();
  //Stripe.publishableKey ="pk_test_51O9z3jHfy7wfxGln7lJoC675hORZlHw5SYJUdhKbjvCPOcTNfOqM5z656zzJw9GLPlV19Ju8hnrk4y4jPRuQYLHY00eT4H1mPg";


  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: HomeScreen()
    );
  }
}
