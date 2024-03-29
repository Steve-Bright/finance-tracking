import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:finance_tracking/view/reusableWidgets/reusableWidgets.dart';
import 'package:finance_tracking/view/homePage/homepage.dart';
import 'package:finance_tracking/controller/signInController.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInController signIn = SignInController();

  @override
  void dispose() {
    signIn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: ListView(
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        child: Image(
                          image: AssetImage('assets/GalaxyRay.png')
                        ),
                      ),
                      // SizedBox( height: 10),
                      Text('Sign In', style: GoogleFonts.quando(
                            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black),
                          )),
                    ],
                  ),
                ),
                const SizedBox( height: 20),
                reusableTextField("Enter Email", Icons.person_outline, signIn.getEmail()),
                const SizedBox( height: 20),
                PasswordTextFormField(
                  labelText: 'Enter the Password',
                  passwordEditingController: signIn.getPassword(),
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
                        signIn.signIn();
                      },
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.only(left: 30, right: 30)),
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                        elevation: MaterialStatePropertyAll(40),
                      ),
                      child: const Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
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
