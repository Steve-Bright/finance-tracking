import 'package:flutter/material.dart';

import 'package:finance_tracking/view/addBudgetListPage.dart';
import 'package:finance_tracking/view/profileDetail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
            children: [
              AddBudgetPage(),
              ProfileDetail()
            ]
        ),
        bottomNavigationBar: TabBar(

            tabs: [
              Tab( child: Icon(Icons.monetization_on_outlined, size: 40)),
              Tab(child: Icon(Icons.person, size: 40)),
            ]
        ),
      ),
    );
  }
}
