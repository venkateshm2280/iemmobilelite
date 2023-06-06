import 'package:flutter/material.dart';
import 'package:iemmobile/widgets/button.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({Key? key}) : super(key: key);

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  bool _obsecureText = true;

  void _togglePwdVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customcolor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(5.0),
          child: Image.asset('assets/images/logoiem.png'),
        ),
        title: Text('Change Password'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Current Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: TextField(
                  obscureText: _obsecureText,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_obsecureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: _togglePwdVisibility,
                      ),
                      labelText: 'New Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Confirm New Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: 150,
                child: CustomButton(
                  borderRadius: BorderRadius.circular(8),
                  backgroundColor: customcolor,
                  text: 'Save',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
