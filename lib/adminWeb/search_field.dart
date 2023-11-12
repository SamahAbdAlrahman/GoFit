
import 'package:flutter/material.dart';
import 'package:gofit_frontend/adminWeb/constants.dart';

import '../screens/User/search.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  // Function to handle the tap action


  @override
  Widget build(BuildContext context) {
    void handleTap() {
      // Implement the desired action here, e.g., show a search dialog
      // or navigate to a search screen.
      // You can use Navigator to navigate to a new screen.
      // Example:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage()));
    }
    return GestureDetector(
      onTap: handleTap, // Call the handleTap function on tap
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for Statistics",
          helperStyle: TextStyle(
            color: textColor.withOpacity(0.5),
            fontSize: 15,
          ),
          fillColor: secondaryColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(Icons.search, color: textColor.withOpacity(0.5)),
        ),
      ),
    );
  }
}
