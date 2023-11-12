import 'package:flutter/material.dart';
import 'package:gofit_frontend/Model/addBlogModels.dart';
import 'package:gofit_frontend/NetworkHandler.dart';

import '../Blog/comment.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({Key? key, required this.addBlogModel, required this.networkHandler}) : super(key: key);

  final AddBlogModel addBlogModel;
  final NetworkHandler networkHandler;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(top: 60,right: 20,left: 20,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: networkHandler.getImage(addBlogModel.username as String),
                ),
                SizedBox(width: 20),
                Text(
                  addBlogModel.username as String,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(

            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0), // Adjust the value to control the corner radius
              image: DecorationImage(
                image: networkHandler.getImage(addBlogModel.id ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              addBlogModel.title ?? "",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              addBlogModel.body ?? "",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            color: Colors.deepOrange,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentPage(addBlogModel: addBlogModel),
                        ),
                      );
                        // Handle the like button press here
                      },
                    ),
                    Text('Like'),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.comment),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommentPage(addBlogModel: addBlogModel),
                          ),
                        );
                        // Handle the comment button press here
                        // You can navigate to a comment page or show a comment dialog
                      },
                    ),
                    Text('Comment'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
