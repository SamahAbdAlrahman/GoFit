import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gofit_frontend/adminWeb/constants.dart';

class UsersByDevice extends StatelessWidget {
  final double subscriberPercentage; // The percentage of subscribers

  UsersByDevice({required this.subscriberPercentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: appPadding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subscribers into Gym',
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              margin: EdgeInsets.all(appPadding),
              padding: EdgeInsets.all(appPadding),
              height: 230,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.deepOrange,
                      value: subscriberPercentage.toInt().toDouble(), // Convert to double
                    ),
                    PieChartSectionData(
                      color: Colors.grey, // Make the other section transparent
                      value: (100 - subscriberPercentage).toInt().toDouble(), // Convert to double
                    ),
                  ],
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0, // Set sections space to 0 for a solid circle
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.deepOrange,
                        size: 10,
                      ),
                      SizedBox(width: appPadding / 2),
                      Text(
                        'Subscriber',
                        style: TextStyle(
                          color: textColor.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: textColor.withOpacity(0.2),
                        size: 10,
                      ),
                      SizedBox(width: appPadding / 2),
                      Text(
                        'Users',
                        style: TextStyle(
                          color: textColor.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
