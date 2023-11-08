import 'package:gofit_frontend/chat/ChatRoom.dart';
import 'package:gofit_frontend/chat/ChatRoom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'group_chats/All_chatsView.dart';
import 'group_chats/group_chat_screen.dart';
class chatingScreen extends StatefulWidget {
  const chatingScreen({super.key});

  @override
  _chatingScreenState createState() => _chatingScreenState();
}

class _chatingScreenState extends State<chatingScreen> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    setStatus("Online");
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey, // Set the color of the Drawer icon to grey
        ),
        backgroundColor: Colors.white,
        title: const Text("Chats" ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body:
      isLoading
          ? Center(
        child: SizedBox(
          height: size.height / 20,
          width: size.height / 20,
          child: const CircularProgressIndicator(),
        ),
      )
          :
      Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          const SizedBox(height: 40),

          Container(
            height: size.height / 14,
            width: size.width,
            alignment: Alignment.center,
            child: SizedBox(
              height: size.height / 14,
              width: size.width / 1.15,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey), // Default border color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.orange), // Border color when focused
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.grey),
                    onPressed: onSearch,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: size.height / 50,
          ),

          SizedBox(
            height: size.height / 30,
          ),
          userMap != null
              ? ListTile(
            onTap: () {
              String roomId = chatRoomId(
                  _auth.currentUser!.displayName!,
                  userMap!['name']);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ChatRoom(
                    chatRoomId: roomId,
                    userMap: userMap!,
                  ),
                ),
              );
            },
            leading: const Icon(Icons.account_box, color: Colors.black),
            title: Text(
              userMap!['name'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(userMap!['email']),
            trailing: const Icon(Icons.chat, color: Colors.black),
          )
              : Container(),
        ],

      ),


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
          shape: BoxShape.circle,
          // تحديد شكل الزر
        ),
        // tooltip: "Create Group",

        child: IconButton(

          icon: const Icon(Icons.groups, color: Colors.white , size:39,),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const GroupChatHomeScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}