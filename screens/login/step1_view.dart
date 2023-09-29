
import 'package:flutter/material.dart';
import 'package:gofit_frontend/screens/login/on_boarding_view.dart';
import '../../common/color_extension.dart';
class Step1View extends StatefulWidget {
  const Step1View({super.key});

  @override
  State<Step1View> createState() => _Step1ViewState();
}

class _Step1ViewState extends State<Step1View> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(

      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true, title:   Text(
      //       "Step 1 of 3",
      //       style: TextStyle(
      //           color: Colors.black54,
      //           fontSize: 23,
      //           fontWeight: FontWeight.bold),
      //     ), ),
      body: 
        
        SafeArea(
          child: Column(
            children: [
             

              const Spacer(),
              Image.asset(
                "assets/img/o.png",
                width: media.width*.9 ,
                height: media.width*.8,
                fit: BoxFit.contain,
              ),
             

          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 30),
          //   child: Text(
          //     "",
          //     textAlign:  TextAlign.center,
          //     style: TextStyle(
          //         color: Color.fromRGBO(30, 20, 40, 1.0),
          //         fontSize: 20,
          //         fontWeight: FontWeight.w500),
          //   ),
          // ),

           Text(
            "Sports and Nutrition workouts will help you\ngain strength, get in better shape and\nembrace a healthy lifestyle",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w400,),
          ),
              const Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  OnBoardingView()));
                    // Navigator.pushAndRemoveUntil(
                    // context, MaterialPageRoute(builder: (context) => const Step1View()), (route) => false,
                    //
                    // ),
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(30, 20, 40, 1.0),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(height: media.width * 0.05),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [1, 2, 3].map((pObj) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: 1 == pObj
                            ? Color.fromRGBO(30, 20, 40, 1.0)
                            : Color.fromRGBO(122, 42, 124, 0.30196078431372547).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(6)),
                  );
                }).toList(),
              ),


             const SizedBox(height: 15,)
            ],
          ),
        )

    );
  }
}