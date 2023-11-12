import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import '../NetworkHandler.dart';
import 'bar_chart_users.dart';
import 'bar_chart_users.dart';
import 'constants.dart';
import 'controller.dart';
import 'dash_board_screen.dart';
import 'dashboard_content.dart';

class Discussions extends StatefulWidget {
  @override
  _DiscussionsState createState() => _DiscussionsState();
}

class _DiscussionsState extends State<Discussions> {
  //List<DiscussionInfoModel> discussionData = [];
  List<dynamic> searchResults = [];
  @override
  void initState() {
    super.initState();
    // Fetch data from the server
    fetchData1();
  }

  Future<void> fetchData1() async {
    try {
      // Replace with your server URL
      final response = await http.get(Uri.parse('http://192.168.111.1:3000/profile/profiles')); // Replace with your API endpoint

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        // Check if the response contains data
        if (jsonData != null && jsonData is List) {
          // Filter the profiles that start with '119' or '120'
          final filteredData = jsonData.where((profile) {
            final username = profile['username'];
            return username.startsWith('119') || username.startsWith('120');
          }).toList();

          // Create DiscussionInfoModel objects from the filtered data
          searchResults = filteredData;
        }
      } else {
        throw Exception('Failed to load data');
      }

      setState(() {});
    } catch (e) {
      print('Error fetching data: $e');
      // Handle errors if the API request fails
    }
  }
// Function to show a dialog for updating the salary
  Future<String?> showSalaryUpdateDialog(String username) async {
    String newSalary = ''; // Initialize with an empty string

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Salary'),
          content: TextFormField(
            decoration: InputDecoration(labelText: 'New Salary'),
            onChanged: (value) {
              newSalary = value; // Update the new salary as the user types
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Update'),
              onPressed: () async {
                updateSalary(username, newSalary);
                fetchNewSalary(username);
                           Navigator.pop(context);

              },
            ),
          ],
        );
      },
    );
  }

// Function to update the salary
// Function to update the salary
  Future<void> updateSalary(String username, String newSalary) async {
    try {
      final response = await http.put(
        Uri.parse('http://192.168.111.1:3000/profile/salary/$username'), // Replace with your server URL
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({'salary': newSalary}),
      );

      if (response.statusCode == 200) {
        final updatedProfile = json.decode(response.body);
        // Handle the updated profile data as needed
        // You can refresh the UI or update the data in the searchResults list

        // Update the UI immediately with the new salary
        setState(() {
          // Find the profile in the searchResults list and update its salary
          final profileToUpdate = searchResults.firstWhere(
                (profile) => profile['username'] == username,
            orElse: () => null,
          );

          if (profileToUpdate != null) {
            profileToUpdate['salary'] = newSalary;
          }
        });

        // Close the dialog
       // Navigator.pop(context);
      } else {
        throw Exception('Failed to update salary');
      }
    } catch (e) {
      print('Error updating salary: $e');
      // Handle errors if the API request fails
    }
  }

// Function to fetch new salary
  Future<void> fetchNewSalary(String username) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.111.1:3000/profile/getsalary/$username'), // Replace with your server URL
      );

      if (response.statusCode == 200) {
        final profileData = json.decode(response.body);
        final newSalary = profileData['salary'] ?? 'Unknown Salary';

        // Update the UI with the new salary immediately
        setState(() {
          // Find the profile in the searchResults list and update its salary
          final profileToUpdate = searchResults.firstWhere(
                (profile) => profile['username'] == username,
            orElse: () => null,
          );

          if (profileToUpdate != null) {
            profileToUpdate['salary'] = newSalary;
          }
        });
      } else {
        throw Exception('Failed to fetch new salary');
      }
    } catch (e) {
      print('Error fetching new salary: $e');
    }
  }


// Function to handle updating the salary after the dialog

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 540,
      padding: EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Employees',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),

            ],
          ),
          SizedBox(
            height: appPadding,
          ),
          Expanded(
            child: ListView(
              children: searchResults.map((profile) {
                final String username = profile['name'] ?? 'Unknown';
                final String profession = profile['profession'] ?? 'Unknown Profession';
                final String salary = profile['salary'] ?? 'Unknown Salary';

                return Card(

                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(5.0),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkHandler().getImage(profile['username']),
                    ),
                    title: Text(
                      username,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Quicksand-Light.ttf",
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' $profession',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Quicksand-Light.ttf",
                          ),
                        ),
                        Row(children: [
                        Text(
                          'Salary: $salary\$',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Quicksand-Light.ttf",
                          ),
                        ),
                          IconButton(onPressed: (){
                            showSalaryUpdateDialog(profile['username']);

                          },
                              icon:Icon(Icons.edit)
                          ),
                        ],),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

        ],
      ),
    );
  }
}
