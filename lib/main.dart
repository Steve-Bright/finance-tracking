import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_tracking/view/authPage/signin.dart';

//Testing
import 'package:finance_tracking/view/homepage.dart';
//Testing end


void main() {
  runApp(const FinanceTracker());
}

class FinanceTracker extends StatelessWidget {
  const FinanceTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}


