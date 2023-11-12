import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gofit_frontend/adminWeb/constants.dart';
import 'package:gofit_frontend/adminWeb/responsive.dart';
import 'package:gofit_frontend/adminWeb/data.dart';
import 'package:http/http.dart' as http;

import 'analytic_info_card.dart';
import 'analytic_info_model.dart';

class AnalyticCards extends StatelessWidget {
  final List<AnalyticInfo> analyticData; // Add this property

  const AnalyticCards({Key? key, required this.analyticData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      child: Responsive(
        mobile: AnalyticInfoCardGridView(
          crossAxisCount: size.width < 650 ? 2 : 4,
          childAspectRatio: size.width < 650 ? 2 : 1.5,
          analyticData: analyticData,
        ),
        tablet: AnalyticInfoCardGridView(analyticData: analyticData,),
        desktop: AnalyticInfoCardGridView(
          childAspectRatio: size.width < 1400 ? 1.5 : 2.1, analyticData: analyticData,
        ),
      ),
    );
  }
}



class AnalyticInfoCardGridView extends StatelessWidget {
  late final List<AnalyticInfo> analyticData;

  AnalyticInfoCardGridView({
    Key? key,
    required this.analyticData, // Pass the analyticData to the constructor
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.4,
  }) : super(key: key);
  final int crossAxisCount;
  final double childAspectRatio;
  int userCount = 0; // Initialize the userCount to 0




  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: analyticData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: appPadding,
        mainAxisSpacing: appPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => AnalyticInfoCard(
        info: analyticData[index],
      ),
    );
  }
}