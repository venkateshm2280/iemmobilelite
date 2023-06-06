import 'package:flutter/material.dart';
import 'package:iemmobile/views/NonTravelClaim/nontravelclaims.dart';
import 'package:iemmobile/views/listview.dart';
import 'package:iemmobile/views/raiseinvoice.dart';
import 'package:iemmobile/views/TravelClaim/travelclaims.dart';
import 'package:iemmobile/widgets/customcolors.dart';

class dashboard extends StatelessWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: iemColor.customColor,
          title: Text('iEM Lite'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.person_2_sharp),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          elevation: 16.0,
          backgroundColor: const Color(0xFF007249),
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text('Charles A'),
                accountEmail: const Text('charles@flexicodeindia.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.brown,
                  child: const Text('IEM'),
                ),
                decoration: const BoxDecoration(color: Colors.green),
              ),
              ListTile(
                title: const Text('Set MPIN',
                    style: TextStyle(color: Colors.white)),
                leading: const IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.lock),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/setmpin');
                },
              ),
              Divider(
                height: 1.5,
              ),
              ListTile(
                title: const Text('Change MPIN',
                    style: TextStyle(color: Colors.white)),
                leading: const IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.lock),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/changempin');
                },
              ),
              Divider(
                height: 1.5,
              ),
              ListTile(
                title: const Text('Change Password',
                    style: TextStyle(color: Colors.white)),
                leading: const IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.key),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/changepwd');
                },
              ),
              Divider(
                height: 1.5,
              ),
              ListTile(
                title: const Text('Notifications',
                    style: TextStyle(color: Colors.white)),
                leading: const IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.notifications),
                ),
              ),
              Divider(
                height: 1.5,
              ),
              ListTile(
                title: const Text('Profile',
                    style: TextStyle(color: Colors.white)),
                leading: const IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.person),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              Divider(
                height: 1.5,
              ),
              ListTile(
                title:
                    const Text('Logout', style: TextStyle(color: Colors.white)),
                leading: const IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.settings),
                ),
              ),
              Divider(
                height: 1.5,
              ),
            ],
          ),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 25.0),
            color: Colors.black12,
            child: dashboardScreens()));
  }
}

class dashboardScreens extends StatelessWidget {
  //const Tab1Page({Key? key}) : super(key: key);
  List<String> imagePaths = [
    'assets/images/travelclaim.png',
    'assets/images/nontravelclaim.png',
    'assets/images/pettycash.png',
    'assets/images/regularinvoice.png',
    'assets/images/gstinvoice.png',
    'assets/images/advances.png',
    'assets/images/raisepr.png',
    'assets/images/inwardgrn.png',
    'assets/images/confirmgrn.png',
    'assets/images/cwlprelease.png',
    'assets/images/assetverify.png',
    'assets/images/assetstransfer.png',
  ];

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'Travel Claim',
      'Non Travel Claim',
      'Petty Cash',
      'Regular Invoice',
      'GST Invoice',
      'Advances',
      'Raise PR',
      'Inward GRN',
      'Confirm GRN',
      'CWIP Release',
      'Asset Verification',
      'Asset Transfer',
    ];

    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.81,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('Tapped Card ${index + 1}');
              if (index + 1 == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TravelClaims()),
                );
              } else if (index + 1 == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NonTravelClaims()),
                );
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(16.0),
                      height: 120,
                      width: 110,
                      child: Image.asset(
                        imagePaths[index],
                      ),
                    ),
                    Wrap(
                      children: [
                        Text(
                          labels[index],
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
