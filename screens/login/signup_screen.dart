import 'package:flutter/material.dart';
import 'package:gofit_frontend/screens/login/complete_signup_screen.dart';
import 'package:gofit_frontend/screens/login/login_screen.dart';
// main_tab_view
import 'package:gofit_frontend/screens/main_tab/main_tab_view.dart';
class NewAccountScreen extends StatefulWidget {
  @override
  _NewAccountScreenState createState() => _NewAccountScreenState();
}

class _NewAccountScreenState extends State<NewAccountScreen> {
  DateTime? _selectedDate; //

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(12, 10, 10, 1.0),
              Color.fromRGBO(66, 11, 86, 0.90),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(9, 8, 5, 0.80),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "Full Name",
                                    prefixIcon: Icon(Icons.person),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    prefixIcon: Icon(Icons.email),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                ),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    prefixIcon: Icon(Icons.lock),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                ),
                                child: GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                      labelText: "Date of Birth",
                                      prefixIcon: Icon(Icons.calendar_today),
                                      border: InputBorder.none,
                                    ),
                                    child: Text(
                                      _selectedDate != null
                                          ? "${_selectedDate!.toLocal()}".split(' ')[0]
                                          : 'Select Date',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),

                        Positioned(
                          bottom: 10,
                          right: 10, // تغيير القيمة من left إلى right للزر next_icon
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CompleteProfileView()),
                              );
                            },
                            child: Image.asset(
                              'assets/img/next_icon.png',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                        SizedBox(height: 45),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: InkWell(
                            onTap: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainTabView(),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/img/goBackIcone.png',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
