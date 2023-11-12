import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:gofit_frontend/Blog/Blogs.dart';
import 'package:gofit_frontend/Model/profileModel.dart';
import 'package:gofit_frontend/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../Blog/addBlog.dart';
import '../screens/home/menu_view.dart';
import '../common_widget/tab_button.dart';
import '../screens/login/on_boarding_view.dart';
import 'ProfileScreen.dart';

class MainProfile1 extends StatefulWidget {
  final String username;

  MainProfile1({Key? key, required this.username}) : super(key: key);

  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile1> {
  Widget currentTab = MenuView();
  int currentState = 0;
  List<String> titleString = ["Home Page", "Profile Page"];
  bool circular = true;

  NetworkHandler networkHandler = NetworkHandler();
  ProfileModel profileModel = ProfileModel(
      DOB: '_dob',
      about: '_about',
      name: '_name',
      profession: '_profession',
      titleline: '_title');

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {

      var response = await networkHandler.get("/profile/getData/${widget.username}");

      setState(() {
        profileModel = ProfileModel.fromJson(response["data"]);
        circular = false;
      });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey, // Set the color of the Drawer icon to grey
        ),
        backgroundColor: Colors.white,
        title: Text(titleString[currentState]),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications,
            color: Colors.grey,),
              onPressed: () {}),
          IconButton(icon: Icon(Icons.messenger,
            color: Colors.grey,),
              onPressed: () {}),

        ],
      ),
      backgroundColor: Colors.white,


      body: circular
          ? Center(child: CircularProgressIndicator())
          : ListView(
        children: <Widget>[

          head(),

          SizedBox(height: 40),
          Divider(
            thickness: 1.3,
          ),
          otherDetails(" Name ", profileModel.name),

          Divider(
            thickness: 0.5,
          ),
          otherDetails("About  ", profileModel.about),
          Divider(
            thickness: 0.5,
          ),
          otherDetails("Date of Birth ", profileModel.DOB),
          Divider(
            thickness: 0.5,
          ),
          otherDetails("Education ", profileModel.profession),
          // Divider(
          //   thickness: 1,
          // ),
          SizedBox(height: 159),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              " Posts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          )
          ,
          SizedBox(height: 50),
          Blogs(
            url: "/blogpost/getOwnBlog",
          ),
        ],
      ),
    );
  }

  Widget head() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SizedBox(
          //   height: 10,
          // ),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkHandler().getImage(
                  profileModel.username as String),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Text(
            profileModel.username as String,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500
                , color: Colors.black87),
          ),
          SizedBox(
            height: 10,
          ),
          Text(profileModel.titleline),
        ],
      ),
    );
  }

  Widget otherDetails(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$label ",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400, color: Color.fromRGBO(
                255, 77, 0, 1.0),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            value,
            style: TextStyle(fontSize: 15,
              fontWeight: FontWeight.w400, color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }




}

