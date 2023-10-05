import 'package:flutter/material.dart';
import 'package:gofit_frontend/screens/login/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              padding: EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[


                  Text(
                    "Login",
       style: TextStyle(color: Colors.white, fontSize:35 , fontWeight: FontWeight.w300),
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
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 160),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO( 80, 78, 78, 1.0),
                                    blurRadius: 30,
                                    offset: Offset(0, 20),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.email),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                        color: Color.fromRGBO(
                                            190, 194, 203, 0.4823529411764706),
                                      )),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.lock),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => NewAccountScreen()));
                              },
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            SizedBox(height: 40),
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color:  Color.fromRGBO(
                                    246, 87, 14, 1.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 80),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewAccountScreen()));
                                },
                                child: Text(
                                  "Don't have an account?",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Positioned(
                    //   bottom: 10,
                    //   left: 180,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.pop(context);
                    //     },
                    //     child: Image.asset(
                    //       'assets/img/goBackIcone.png',
                    //       width: 28,
                    //       height: 28,
                    //     ),
                    //   ),
                    // ),






                  ],



                ),
              ),
            ),
          ],
        ),

      ),
    );

  }
}
