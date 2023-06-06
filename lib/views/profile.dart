import 'package:flutter/material.dart';
import 'package:iemmobile/views/changempin.dart';
import 'package:iemmobile/views/changepassword.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 900,
            color: Colors.green,
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                'Charles A',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 15.0)),
              Icon(Icons.email_rounded),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'charles@flexicodeindia.com',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                width: 10.0,
              ),
              Icon(Icons.phone),
              SizedBox(
                width: 5.0,
              ),
              Text('+91-96000 16917'),
            ],
          ),
          SizedBox(
            height: 70.0,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 40)),
              Text(
                'Full Name',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 150.0,
              ),
              Text(
                'Role',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 40.0)),
              Text(
                'Charles A',
              ),
              SizedBox(
                width: 155.0,
              ),
              Text(
                'Employee - General',
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 40.0)),
              Text(
                'Grade',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 170.0,
              ),
              Text(
                'Designation',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 40.0)),
              Text(
                'SM2',
              ),
              SizedBox(
                width: 185.0,
              ),
              Text(
                'Vice President',
              ),
            ],
          ),
          SizedBox(
            height: 150.0,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 40.0)),
              GestureDetector(
                child: Text(
                  'Change Password',
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Changepassword()));
                },
              ),
              SizedBox(
                width: 105.0,
              ),
              GestureDetector(
                child: Text(
                  'Change MPIN',
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Changempin()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
