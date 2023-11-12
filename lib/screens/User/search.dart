import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io' as io;

import '../../NetworkHandler.dart';
import '../../Profile/viewProfile.dart'; // Import 'File' from dart:io with a prefix

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> searchResults = [];

  // Function to fetch search results
  Future<void> search(String query) async {
    final String apiUrl = 'http://192.168.111.1:3000/searchByStart?startChar=$query';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        searchResults = data;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Add a listener to the search bar to trigger search as you type
    _searchController.addListener(() {
      search(_searchController.text);
    });
  }

  @override
  void dispose() {
    // Remove the listener when the widget is disposed
    _searchController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            left: 0,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 6.0),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: searchResults.map((profile) {
                    final String username = profile['name'] ?? 'Unknown';
                    final String profession = profile['profession'] ?? 'Unknown Profession';

                    return Card(
                      color: Colors.white,
                      elevation: 4,
                      margin: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        children: [
                          ListTile(
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
                            subtitle: Text(
                              profession,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Quicksand-Light.ttf",
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainProfile1(
                                      // Pass user information to the ProfileScreen
                                      username: profile['username'],

                                    ),
                                  ),
                                );
                                // Add your button action here
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0), // Adjust the radius for circular edges
                                )),
                              ),
                              child: Text(
                                "View Profile",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14, // Adjust the font size as needed
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }
}
