import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:finance_tracking/view/reusableWidgets/reusableWidgets.dart';
import 'package:finance_tracking/view/homepage.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {


    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blueAccent,
                Colors.purple
              ]
            ),
            // color: Color(0xFF0c222f),
            color: Colors.lightBlue,
          ),
          child: ListView(
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/profile_pic.jpg'),
                        radius: 70,
                      ),
                      SizedBox( height: 20),
                      Text('Galaxy Ray', style: GoogleFonts.quando(
                            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),
                          )),
                    ],
                  ),
                ),
                const SizedBox( height: 20),
                reusableTextField("Enter Email", Icons.person_outline, false, _emailController),
                const SizedBox( height: 20),
                PasswordTextFormField(
                  labelText: 'Enter the Password',
                  passwordEditingController: _passwordController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter password.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 320,
                    height: 50,
                    child: TextButton(
                      onPressed: (){
                        Get.off(const HomePage());
                      },
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.only(left: 30, right: 30)),
                        backgroundColor: MaterialStatePropertyAll(Colors.purpleAccent),
                        elevation: MaterialStatePropertyAll(40),
                      ),
                      child: const Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                )
              ]
            )],
          ),
        ),
      )
    );
  }
}
