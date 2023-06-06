import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iemmobile/views/changempin.dart';
import 'package:iemmobile/views/changepassword.dart';
import 'package:iemmobile/views/exampleretrofit.dart';
import 'package:iemmobile/views/listview.dart';
import 'package:iemmobile/views/loginscreen.dart';
import 'package:iemmobile/views/postlist.dart';
import 'package:iemmobile/views/profile.dart';
import 'package:iemmobile/views/raiseinvoice.dart';
import 'package:iemmobile/views/setmpin.dart';
import 'package:iemmobile/widgets/customcolors.dart';

void main() {
  runApp(iemapp());
}

class iemapp extends StatelessWidget {
  const iemapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      routes: {
        '/changepwd': (context) => Changepassword(),
        '/changempin': (context) => Changempin(),
        '/listsamples': (context) => Listviewsamples(),
        '/postlists': (context) => Postlists(),
        '/setmpin': (context) => Setmpin(),
        '/exampleretrofit': (context) => ExampleRetrofit(),
        '/profile': (context) => Profile(),
        '/raiseinvoice': (context) => RaiseInvoice(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: iemColor.customColor)),
      home: Splashscreen(),
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(
        'assets/images/logoiem.png',
      ),
    );
  }
}
