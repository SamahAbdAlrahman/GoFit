// import 'package:gofit_frontend/group_chats/create_group/create_group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'create_group.dart';

class AddMembersInGroup extends StatefulWidget {
  const AddMembersInGroup({super.key});

  @override
  State<AddMembersInGroup> createState() => _AddMembersInGroupState();
}

class _AddMembersInGroupState extends State<AddMembersInGroup> {
  final TextEditingController _search = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> membersList = [];
  bool isLoading = false;
  Map<String, dynamic>? userMap;

  @override
  void initState() {
    super.initState();
    getCurrentUserDetails();
  }

  void getCurrentUserDetails() async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((map) {
      setState(() {
        membersList.add({
          "name": map['name'],
          "email": map['email'],
          "uid": map['uid'],
          "isAdmin": true,
        });
      });
    });
  }

  void onSearch() async {
    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }

  void onResultTap() {
    bool isAlreadyExist = false;

    for (int i = 0; i < membersList.length; i++) {
      if (membersList[i]['uid'] == userMap!['uid']) {
        isAlreadyExist = true;
      }
    }

    if (!isAlreadyExist) {
      setState(() {
        membersList.add({
          "name": userMap!['name'],
          "email": userMap!['email'],
          "uid": userMap!['uid'],
          "isAdmin": false,
        });

        userMap = null;
      });
    }
  }

  void onRemoveMembers(int index) {
    if (membersList[index]['uid'] != _auth.currentUser!.uid) {
      setState(() {
        membersList.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey, // Set the color of the Drawer icon to grey
        ),
        title: const Text("Select Members" , style:TextStyle(color: Colors.black87 , fontWeight: FontWeight.w400),),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: membersList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => onRemoveMembers(index),
                    leading: const Icon(Icons.account_box),
                    title: Text(membersList[index]['name']),
                    subtitle: Text(membersList[index]['email']),
                    trailing: const Icon(Icons.cancel_presentation_sharp),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Container(
              height: size.height / 14,
              width: size.width,
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height / 14,
                width: size.width / 1.15,
                child: TextField(
                  controller: _search,
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: size.height / 50,
            ),
            isLoading
                ? Container(
                    height: size.height / 12,
                    width: size.height / 12,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: onSearch,
                    child: const Text("Search"),
                  ),
            userMap != null
                ? ListTile(
                    onTap: onResultTap,
                    leading: const Icon(Icons.account_box),
                    title: Text(userMap!['name']),
                    subtitle: Text(userMap!['email']),
                    trailing: const Icon(Icons.add_box_outlined),
                  )
                : const SizedBox(),
          ],
        ),
      ),
      floatingActionButton: membersList.length >= 2

          ? FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CreateGroup(
              membersList: membersList,
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 77, 0, 1.0), // اللون الثاني
                Color.fromRGBO(232, 174, 137, 1.0), // اللون الأول
              ],
              begin: Alignment.topCenter, // بداية التدرج
              // end: Alignment.bottomCenter, // نهاية التدرج
            ),
            shape: BoxShape.circle, // تحديد شكل الزر
          ),
          child: Icon(
            Icons.forward,
            color: Colors.white,
            size: 29,
          ),
        ),
      )

          : const SizedBox(),
    );
  }
}
// floatingActionButton: Container(
// width: 56.0, // تحديد العرض
// height: 56.0, // تحديد الارتفاع
// decoration: BoxDecoration(
// gradient: LinearGradient(
// colors: [
// Color.fromRGBO(255, 77, 0, 1.0), // اللون الثاني
// Color.fromRGBO(232, 174, 137, 1.0), //// اللون الأول
// ],
// begin: Alignment.topCenter, // بداية التدرج
// // end: Alignment.bottomCenter, // نهاية التدرج
// ),
// shape: BoxShape.circle,
// // تحديد شكل الزر
// ),
// // tooltip: "Create Group",
//
// child: IconButton(
//
// icon: const Icon(Icons.groups, color: Colors.white , size:39,),
// onPressed: () {
// Navigator.of(context).push(
// MaterialPageRoute(
// builder: (_) => const GroupChatHomeScreen(),
// ),
// );
// },
// ),
// ),