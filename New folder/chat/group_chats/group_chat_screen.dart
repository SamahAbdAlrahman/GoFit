// import 'package:gofit_frontend/group_chats/create_group/add_members.dart';
// import 'package:gofit_frontend/group_chats/group_chat_room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'create_group/add_members.dart';
import 'group_chat_room.dart';

class GroupChatHomeScreen extends StatefulWidget {
  const GroupChatHomeScreen({super.key});

  @override
  _GroupChatHomeScreenState createState() => _GroupChatHomeScreenState();
}

class _GroupChatHomeScreenState extends State<GroupChatHomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = true;

  List groupList = [];

  @override
  void initState() {
    super.initState();
    getAvailableGroups();
  }

  void getAvailableGroups() async {
    String uid = _auth.currentUser!.uid;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('groups')
        .get()
        .then((value) {
      setState(() {
        groupList = value.docs;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey, // Set the color of the Drawer icon to grey
        ),
        title: const Text("Groups" , style:TextStyle(color: Colors.black87 , fontWeight: FontWeight.w400),),
        backgroundColor: Colors.white,
      ),

      body: isLoading
          ?
      Container(

              height: size.height,
              width: size.width,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),

            )

          : ListView.builder(
              itemCount: groupList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => GroupChatRoom(
                        groupName: groupList[index]['name'],
                        groupChatId: groupList[index]['id'],
                      ),
                    ),
                  ),
                  leading: const Icon(Icons.group),
                  title: Text(groupList[index]['name'] ,),

                );

              },

            ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (_) => const AddMembersInGroup(),
      //     ),
      //   ),
      //   tooltip: "Create Group",
      //   child: Transform.scale(
      //     scale: 1.5, // زيادة هذا الرقم لزيادة حجم الأيقونة
      //     child: Icon(
      //       Icons.add,
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      floatingActionButton: Container(
        width: 56.0, // تحديد العرض
        height: 56.0, // تحديد الارتفاع
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 77, 0, 1.0), // اللون الثاني
              Color.fromRGBO(232, 174, 137, 1.0), //// اللون الأول
            ],
            begin: Alignment.topCenter, // بداية التدرج
            // end: Alignment.bottomCenter, // نهاية التدرج
          ),
          shape: BoxShape.circle, // تحديد شكل الزر
        ),
        // tooltip: "Create Group",
        child: IconButton(
          icon: const Icon(Icons.add, color: Colors.white, size:30,),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const AddMembersInGroup(),
              ),
            );
          },
        ),
      ),
    );
  }
}
