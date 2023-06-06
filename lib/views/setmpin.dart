import 'package:flutter/material.dart';
import 'package:iemmobile/widgets/button.dart';
import 'package:iemmobile/widgets/customcolors.dart';

class Setmpin extends StatefulWidget {
  const Setmpin({Key? key}) : super(key: key);

  @override
  State<Setmpin> createState() => _SetmpinState();
}

class _SetmpinState extends State<Setmpin> {
  List<FocusNode> _focusNodes =
      List<FocusNode>.generate(4, (index) => FocusNode());
  List<TextEditingController> _controllers =
      List<TextEditingController>.generate(
    4,
    (index) => TextEditingController(),
  );

  List<FocusNode> _focusNodes1 =
      List<FocusNode>.generate(4, (index) => FocusNode());
  List<TextEditingController> _controllers1 =
      List<TextEditingController>.generate(
    4,
    (index) => TextEditingController(),
  );

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _controllers.length - 1; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.length == 1) {
          _focusNodes[i + 1].requestFocus();
        }
      });
    }
    for (var i = 0; i < _controllers1.length - 1; i++) {
      _controllers1[i].addListener(() {
        if (_controllers1[i].text.length == 1) {
          _focusNodes1[i + 1].requestFocus();
        }
      });
    }
  }

  @override
  void dispose() {
    for (var i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].dispose();
      _controllers[i].dispose();
    }
    for (var i = 0; i < _focusNodes1.length; i++) {
      _focusNodes1[i].dispose();
      _controllers1[i].dispose();
    }
    super.dispose();
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
        title: Text('Set MPIN'),
        centerTitle: true,
      ),
      body: Container(
        height: 1300,
        padding: EdgeInsets.only(top: 55),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  'Enter MPIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextField(
                      autofocus: true,
                      focusNode: _focusNodes[0],
                      controller: _controllers[0],
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    )),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                        child: TextField(
                      autofocus: true,
                      maxLength: 1,
                      focusNode: _focusNodes[1],
                      controller: _controllers[1],
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    )),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                        child: TextField(
                      autofocus: true,
                      focusNode: _focusNodes[2],
                      controller: _controllers[2],
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    )),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                        child: TextField(
                      autofocus: true,
                      focusNode: _focusNodes[3],
                      controller: _controllers[3],
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    )),
                    SizedBox(
                      width: 15.0,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  'Confirm MPIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextField(
                      autofocus: true,
                      focusNode: _focusNodes1[0],
                      controller: _controllers1[0],
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    )),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                        child: TextField(
                      autofocus: true,
                      maxLength: 1,
                      focusNode: _focusNodes1[1],
                      controller: _controllers1[1],
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    )),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                        child: TextField(
                      autofocus: true,
                      focusNode: _focusNodes1[2],
                      controller: _controllers1[2],
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    )),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                        child: TextField(
                      autofocus: true,
                      focusNode: _focusNodes1[3],
                      controller: _controllers1[3],
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    )),
                    SizedBox(
                      width: 15.0,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
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
