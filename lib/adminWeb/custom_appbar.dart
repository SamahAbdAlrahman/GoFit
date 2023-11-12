import 'package:flutter/material.dart';
import 'package:gofit_frontend/adminWeb/constants.dart';
import 'package:gofit_frontend/adminWeb/responsive.dart';
import 'package:gofit_frontend/adminWeb/controller.dart';
import 'package:gofit_frontend/adminWeb/profile_info.dart';
import 'package:gofit_frontend/adminWeb/search_field.dart';
import 'package:provider/provider.dart';

import '../screens/User/search.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: context.read<Controller>().controlMenu,
            icon: Icon(Icons.menu, color: textColor.withOpacity(0.5)),
          ),
        Spacer(), // Use Spacer to push items to the right
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage()));
          },
          icon: Icon(Icons.search),
        ),
        ProfileInfo(),
      ],
    );
  }
}
