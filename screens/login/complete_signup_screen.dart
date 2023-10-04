import 'package:flutter/material.dart';
import 'package:gofit_frontend/screens/login/signup_screen.dart';

class CompleteProfileView extends StatefulWidget {
  @override
  _CompleteProfileViewState createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  String selectedGender = '';
  double height = 170.0;
  double weight = 70.0;
  String activityLevel = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [  Color.fromRGBO(48, 58, 30, 1.0),
              Color.fromRGBO(56, 87, 4, 0.81),
              Color.fromRGBO(56, 87, 4, 0.750),
              Color.fromRGBO(56, 87, 4, 0.5019607843137255),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 90),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Let’s complete your profile",
                    style: TextStyle(color: Colors.grey, fontSize:35 , fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 17.0),
                      Text(
                        "Gender",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          buildGenderOption("Male"),
                          buildGenderOption("Female"),
                        ],
                      ),
                      SizedBox(height: 22.0),
                      Text(
                        "Height: ${height.toStringAsFixed(1)} CM",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                      Slider(
                        value: height,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                        min: 100.0,
                        max: 220.0,
                        divisions: 120,
                        label: height.toStringAsFixed(2),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Weight: ${weight.toStringAsFixed(1)} KG",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                      Slider(
                        value: weight,
                        onChanged: (value) {
                          setState(() {
                            weight = value;
                          });
                        },
                        min: 30.0,
                        max: 250.0,
                        divisions: 160,
                        label: weight.toStringAsFixed(2),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Activity Level",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                      buildActivityLevelOption("Beginner"),
                      buildActivityLevelOption("Intermediate"),
                      buildActivityLevelOption("Advanced"),
                      SizedBox(height: 20.0),







                      ElevatedButton(
                        onPressed: () {
                          //

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => CompleteProfileView()), //
                          // );
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 22,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary:      Color.fromRGBO(56, 87, 4, 0.8980392156862745),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0), // Adjust the border radius
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 70.0), // Adjust padding here
                        ),
                      ),




                      SizedBox(height:8.0),
                      Positioned(
                        bottom: 8,
                        left: 10,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => NewAccountScreen()));
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGenderOption(String gender) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedGender == gender ? Colors.black54 : Colors.grey,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          gender,
          style: TextStyle(
            fontSize: 15,
            color: selectedGender == gender ? Colors.black54 : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildActivityLevelOption(String level) {
    return RadioListTile<String>(
      title: Text(
        level,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black54,
        ),
      ),
      value: level,
      groupValue: activityLevel,
      onChanged: (value) {
        setState(() {
          activityLevel = value!;
        });
      },
    );
  }
}
