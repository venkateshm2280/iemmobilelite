import 'package:flutter/material.dart';
import 'package:iemmobile/views/changepassword.dart';
import 'package:iemmobile/views/listview.dart';
import 'package:iemmobile/views/loginscreen.dart';
import 'package:iemmobile/views/raiseinvoice.dart';
import 'package:iemmobile/widgets/customcolors.dart';

class dashboard extends StatelessWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color customColor = Theme.of(context).colorScheme.primary;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
                kToolbarHeight + 60.0), // Adjust the height value
            child: Container(
              color: customColor, // Set the background color here
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors
                        .transparent, // Make the AppBar background transparent
                    title: Text('iEM Lite'),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.person_2_sharp),
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(height: 10.0), // Add space between AppBar and TabBar
                  TabBar(
                    tabs: const [
                      Tab(
                        text: 'My Transactions',
                      ),
                      Tab(
                        text: 'My Approvals',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          drawer: Drawer(
            elevation: 16.0,
            backgroundColor: const Color(0xFF007249),
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text('Venkatesh'),
                  accountEmail: const Text('venkatesh.m@fintantra.in'),
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
                  title: const Text('Logout',
                      style: TextStyle(color: Colors.white)),
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
          body: TabBarView(
            children: [Tab1Page(), Tab2Page()],
          ),
        ),
      ),
    );
  }
}

class Tab1Page extends StatelessWidget {
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
      'Non Trvl. Claim',
      'Petty Cash',
      'Reg. Invoice',
      'GST Invoice',
      'Advances',
      'Raise PR',
      'Inward GRN',
      'Confirm GRN',
      'CWLP Release',
      'Asset Verify',
      'Asset Transfer',
    ];

    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.83,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('Tapped Card ${index + 1}');
              if (index + 1 == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Listviewsamples()),
                );
              } else if (index + 1 == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RaiseInvoice()),
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
                    Text(
                      labels[index],
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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

class ImageView extends StatelessWidget {
  final String imageUrl;
  const ImageView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        imageUrl,
      ),
    );
  }
}

class Tab2Page extends StatelessWidget {
  //const Tab2Page({Key? key}) : super(key: key);
  List<String> imagePaths = [
    'assets/images/travelclaim.png',
    'assets/images/nontravelclaim.png',
    'assets/images/pettycash.png',
    'assets/images/regularinvoice.png',
    'assets/images/gstinvoice.png',
    'assets/images/advances.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.83),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('Tapped Card ${index + 1}');
              if (index + 1 == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Listviewsamples()));
              } else if (index + 1 == 2) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Changepassword()));
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  25.0), // Adjust the border radius as needed
              child: Card(
                child: Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(16.0),
                  height: 230,
                  width: 110,
                  child: Image.asset(
                    imagePaths[index],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
