import 'package:flutter/material.dart';
import 'package:gofit_frontend/screens/login/login_screen.dart';
import '../../common/color_extension.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController? controller = PageController();
  int selectPage = 0;

  List<Map<String, String>> pageArr = [

    {
      "title": "",
      "subtitle":
      "",
      "image": "assets/img/o.png",
    },
    {
      "title": "Be stronger",
      "subtitle":
      "Take 30 minutes of bodybuilding every day\nto get physically fit and healthy.",
      "image": "assets/img/2i.jfif",
    },
    {
      "title": "Have a good health",
      "subtitle":
      "Being healthy is all, no health is nothing. So why do not we",
      "image": "assets/img/hel.jfif",
      // hel2.png
      // hel.jfif
    },
    {
      "title": "Have nice body",
      "subtitle":
      "Bad body shape, poor sleep, lack of strength, weight gain, weak bones, easily traumatized body, depressed, stressed, poor metabolism, poor resistance",
      "image": "assets/img/nicebody.png",
      // nicebody.png
      // on_board_3.png
    }
  ];

  int currentPage = 0; // Store the current page data here

  @override
  void initState() {
    super.initState();
    controller?.addListener(() {
      selectPage = controller?.page?.round() ?? 0;
      currentPage = selectPage; // Update the currentPage variable

      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index];
                return Column(
                  children: [
                    SizedBox(height: media.width * 0.15),
                    Text(
                      pObj["title"]!,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: media.width * 0.05),
                    Container(
                      color: Colors.white,
                      child: Center(
                        child: Image.asset(
                          pObj["image"]!,
                          width: media.width * 0.8,
                          height: media.width * 0.8,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        pObj["subtitle"]!, // Use currentPage to access subtitle
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageArr.map((pObj) {
                    var index = pageArr.indexOf(pObj);
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: currentPage == index
                            ? Color.fromRGBO(30, 20, 40, 1.0)
                            : Color.fromRGBO(122, 42, 124, 0.30196078431372547).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: media.width * 0.05),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.pushAndRemoveUntil(
                      // context, MaterialPageRoute(builder: (context) => const Step1View()), (route) => false,
                    //
                    // ),
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
                  },
                  child: Text(
                    "Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 22,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(30, 20, 40, 1.0),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                  ),
                ),
                SizedBox(height: media.width * 0.05),
              ],
            ),
          ),
        ],
      ),
    );
  }
}