import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_pic.jpg'),
                    radius: 120,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Swam Htet', style: TextStyle(fontSize: 23))
                    ]
                  )
                ),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Department', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Finance', style: TextStyle(fontSize: 23))
                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Manager', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Mr. Clark Kent', style: TextStyle(fontSize: 23))
                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Contact Information', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('swemhtet.net@gmail.com', style: TextStyle(fontSize: 23))
                        ]
                    )
                )
              ]
            )
          ],
        ),
      )
    );
  }
}
