// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:student_support_app/components/mybutton.dart';
import 'package:student_support_app/home_page.dart';
import 'colors.dart' as color;
import 'components/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  void signUserIn(BuildContext context) {
    // Navigate to HomePage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Icon(
                  Icons.support_agent,
                  size: 100,
                  color: Colors.blueGrey.shade900,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Welcome back buddy',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey.shade400),
                ),
                SizedBox(
                  height: 30,
                ),
                //USERNAME FIELD
                UserTextField(
                  controller: usernamecontroller,
                  hintText: 'Username',
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                //PASSWORD FIELD
                UserTextField(
                  controller: passwordcontroller,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                //SUBMIT BUTTON WITH PERFORMNING AUTH AND REDIRECTING TO HOMEPAGE
                MyButton(
                  onTap: () => signUserIn(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
