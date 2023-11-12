import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/addBlogModels.dart';
import '../Model/profileModel.dart';
import '../NetworkHandler.dart';

class CommentPage extends StatefulWidget {
  final AddBlogModel addBlogModel;

  CommentPage({required this.addBlogModel});

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<Comment> comments = []; // Create a Comment class to store comments
  List<Comment> parseComments(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
  }
  bool circular = true;
  int commentCount = 0; // Replace with the actual initial comment count

  TextEditingController commentController = TextEditingController();

  NetworkHandler networkHandler = NetworkHandler();
  ProfileModel profileModel = ProfileModel(DOB: '_dob',
      about: '_about',
      name: '_name',
      profession: '_profession',
      titleline: '_title');
  @override
  void initState() {
    super.initState();
    fetchData();
    fetchUpdatedComments(widget.addBlogModel.id as String);
  }
  void fetchData() async {
    var response = await networkHandler.get("/profile/getData");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      circular = false;
    });
  }
  Future<void> addLike() async {
    final String publisherName = widget.addBlogModel.username as String; // Replace with actual publisher name
    final String likerName = profileModel.name; // Replace with actual liker name
    final String postId = widget.addBlogModel.id ?? ""; // Replace with actual post ID

    // Call the API endpoint to add a like
    final response = await http.post(
      Uri.parse('http://192.168.111.1:3000/Like'),
      body: jsonEncode({
        'postId': postId,
        'publisherName': publisherName,
        'likerName': likerName,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    int? likes = widget.addBlogModel.share; // Assuming 'likes' is nullable

    if (likes != null) {
      likes++; // Increment the local variable
      setState(() {
        widget.addBlogModel.share = likes; // Update the widget property with the new value
      });
    if (response.statusCode == 200) {
      // Like successfully added
      // Update the like count in the UI

      }

    } else {
      // Handle error in adding the like
    }
  }

  void addComment() async {

    String newComment = commentController.text;
    if (newComment != null && newComment.isNotEmpty) {
      // Create a Comment object
      Comment newCommentObject = Comment(
        name: profileModel.name, // Replace with the actual user's name
        image:(NetworkHandler().getImage(profileModel.username as String) as NetworkImage).url,
        commentText: newComment,
        blogId: widget.addBlogModel.id as String, // Use the blog post's ID
      );

      // Send the new comment to your backend for storage
      await sendCommentToBackend(newCommentObject);

      // After successfully storing the comment, fetch the updated comments
       fetchUpdatedComments(widget.addBlogModel.id as String);

      setState(() {
        int? comment = widget.addBlogModel.comment; // Assuming 'likes' is nullable

        if (comment != null) {
          comment++; // Increment the local variable

          widget.addBlogModel.comment =
              comment; // Update the widget property with the new value
        }
        comments.insert(0, newCommentObject); // Add the comment to the top of the list
        commentController.clear(); // Clear the input field
      });
    }
  }
  Future<void> sendCommentToBackend(Comment comment) async {
    final Uri uri = Uri.parse('http://192.168.111.1:3000/comments/addComment'); // Replace with your backend API endpoint

    final Map<String, dynamic> commentData = {
      'name': comment.name,
      'image': comment.image,
      'commentText': comment.commentText,
      'blogId': comment.blogId,
    };

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(commentData),
    );

    if (response.statusCode == 200) {
      // Comment successfully added to the backend
    } else {
      // Handle error in adding the comment
    }
  }
  void fetchUpdatedComments(String blogPostId) async {
    final response = await http.get(
      Uri.parse('http://192.168.111.1:3000/comments/getCommentsByBlog/$blogPostId'),
    );

    if (response.statusCode == 200) {
      // Parse and update the comments in your Flutter app's state
      final List<Comment> updatedComments = parseComments(response.body);
      setState(() {
        comments = updatedComments;
      });
    } else {
      // Handle error in fetching updated comments
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10, right: 300),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              // Rest of your content
            ],
          ),

          Container(
            // You can set the height and decoration as per your design
            padding: EdgeInsets.all(8.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Blog Image (Replace with your actual image widget)
                Container(
                  width: 300,
                  height: 130,  // Increase the height to accommodate more content
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: networkHandler.getImage(widget.addBlogModel.id ?? ""),
                      fit: BoxFit.cover,
                    ),

                  ),
                ),
                SizedBox(height: 5),
                // Title and Body of the Blog Post
                Text(
                  widget.addBlogModel.title as String, // Replace with the actual title
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                   IconButton(onPressed: (){addLike();}, icon: Icon(Icons.thumb_up)) ,
                    Text('${widget.addBlogModel.share} Likes'),],),
                    SizedBox(width: 60),
                    Column(children: [
                    IconButton(onPressed: (){addComment();}, icon: Icon(Icons.comment)) ,
                    Text('${widget.addBlogModel.comment} comments'),
                    ],), // Display the updated comment count
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Colors.black,
          thickness: 2,), // Add a divider between top and comments
SizedBox(height: 5,),
          Text(

            'Comments', // Add this text widget
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(comments[index].image.toString()),
                  ),
                  title: Text(comments[index].name),
                  subtitle: Text(comments[index].commentText),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 50.0), // زيادة القيمة العليا (40.0)
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.orange),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child:TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      labelText: 'Write a comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                     // contentPadding: EdgeInsets.only(top: 3.0), // زيادة الهامش العلوي لرفع الحقل
                    ),
                  )


                ),
                SizedBox(width: 16.0), // تباعد بين الحقل والزر
                GestureDetector(
                  onTap: addComment, // اضغط على الزر
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange, // لون الخلفية
                      shape: BoxShape.circle, // شكل دائري
                    ),
                    child: Icon(
                      Icons.send,
                      color: Colors.white, // لون الرمز
                    ),
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}

class Comment {
  final String name;
  final String image;
  final String commentText;
  final String blogId;
  Comment({
    required this.name,
    required this.image,
    required this.commentText,
    required this.blogId,

  });
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      name: json['name'],
      image: json['image'],
      commentText: json['commentText'],
      blogId: json['blogId'],
    );
  }

}
