import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gofit_frontend/screens/main_tab/main_tab_view.dart';
import '../../common/colo_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/select_datetime.dart';
import '../../common_widget/select_picker.dart';
// import '../menu/menu_view.dart';

class Step3View extends StatefulWidget {
  const Step3View({super.key});

  @override
  State<Step3View> createState() => _Step3ViewState();
}

class _Step3ViewState extends State<Step3View> {
  bool isAppleHealth = true;
  DateTime? selectDate;
  String? selectHeight;
  String? selectWeight;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: TColor.white,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/img/back.png",
                width: 25,
                height: 25,
              )),
          title: Text(
            "Step 3 of 3",
            style: TextStyle(
                color: TColor.primary,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Personal Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Let us know about you to speed up the result, Get fit with your personal workout plan!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.secondaryText, fontSize: 16),
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Apple Health",
                                style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Allow access ti fill my parameters",
                                style: TextStyle(
                                    color: TColor.secondaryText, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        CupertinoSwitch(
                            activeColor: TColor.primary,
                            value: isAppleHealth,
                            onChanged: (newVal) {
                              setState(() {
                                isAppleHealth = isAppleHealth;
                              });
                            })
                      ],
                    ),
                    SizedBox(height: media.width * 0.05),
                    Divider(color: TColor.divider, height: 1),
                    SelectDateTime(
                      title: "Birthday",
                      didChange: (newDate) {
                        setState(() {
                          selectDate = newDate;
                        });
                      },
                      selectDate: selectDate,
                    ),
                    Divider(color: TColor.divider, height: 1),
                    SelectPicker(
                      allVal: const [
                        "150 cm",
                        "151 cm",
                        "152 cm",
                        "153 cm",
                        "154 cm",
                        "155 cm",
                        "156 cm",
                        "157 cm",
                        "158 cm",
                        "159 cm",
                        "160 cm",
                        "161 cm",
                        "162 cm",
                        "163 cm",
                        "164 cm",
                        "165 cm",
                        "166 cm",
                        "167 cm",
                        "168 cm",
                        "169 cm",
                        "170 cm",
                        "171 cm",
                        "172 cm"
                        "173 cm",
                        "174 cm",
                        "175 cm",
                        "176 cm",
                        "177 cm",
                        "178 cm",
                        "179 cm",
                        "180 cm",
                        "181 cm",
                        "182 cm",
                        "183 cm",
                        "184 cm",
                        "185 cm",
                        "186 cm",
                        "187 cm",
                        "188 cm",
                        "189 cm",
                        "190 cm",
                        "191 cm",
                        "192 cm"
                      ],
                      selectVal: selectHeight,
                      title: "Height",
                      didChange: (newVal) {
                        setState(() {
                          selectHeight = newVal;
                        });
                      },
                    ),
                    Divider(color: TColor.divider, height: 1),
                    SelectPicker(
                      allVal: const [
                        "44 kg",
                        "45 Kg",
                        "46 kg",
                        "47 kg",
                        "48 kg",
                        "49 kg",
                        "50 kg",
                        "51 Kg",
                        "52 kg",
                        "53 kg",
                        "54 kg",
                        "55 kg",
                        "56 kg",
                        "57 kg",
                        "58 kg",
                        "59 kg",
                        "60 Kg",
                        "61 Kg",
                        "62 kg",
                        "63 kg",
                        "64 kg",
                        "65 kg",
                        "66 kg",
                        "67 kg",
                        "68 kg",
                        "70 kg",
                        "71 Kg",
                        "72 kg",
                        "73 kg",
                        "74 kg",
                        "75 kg",
                        "76 kg",
                        "77 kg",
                        "78 kg",
                        "79 kg",
                        "80 kg",
                        "81 Kg",
                        "82 kg",
                        "83 kg",
                        "84 kg",
                        "85 kg",
                        "86 kg",
                        "87 kg",
                        "88 kg",
                        "89 kg",
                        "90 kg",
                        "91 Kg",
                        "92 kg",
                        "93 kg",
                        "94 kg",
                        "95 kg",
                        "96 kg",
                        "97 kg",
                        "98 kg",

                      ],
                      selectVal: selectWeight,
                      title: "Weight",
                      didChange: (newVal) {
                        setState(() {
                          selectWeight = newVal;
                        });
                      },
                    ),
                    Divider(color: TColor.divider, height: 1),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: media.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gender",
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          
                          CupertinoSegmentedControl(
                              groupValue: isMale,
                              selectedColor: TColor.primary,
                              unselectedColor: TColor.white,
                              borderColor: TColor.primary,
                              children: const {
                                true: Text(" Male ",
                                    style: TextStyle(fontSize: 18)),
                                false: Text(" Female ",
                                    style: TextStyle(fontSize: 18))
                              },
                              onValueChanged: (isMaleVal) {
                                setState(() {
                                  isMale = isMaleVal;
                                });
                              }, padding: EdgeInsets.zero, )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: RoundButton(
                  title: "Start",
                  onPressed: () {

                    //رح يروح على البروفايل تبعه
           Navigator.push(context, MaterialPageRoute(builder:
               (context) => const MainTabView() ));
           // **************************************************************************
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [1, 2, 3].map((pObj) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: 3 == pObj
                            ? TColor.primary
                            : TColor.gray.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(6)

                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ));
  }
}
