import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofit_frontend/adminWeb/constants.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({Key? key, required this.title, required this.svgSrc, required this.tap}) : super(key: key);

  final String title, svgSrc;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set the background color to white
      child: ListTile(
        onTap: tap,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(svgSrc, color: Colors.black45, height: 20),
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
