import 'package:flutter/material.dart';
import 'package:iemmobile/widgets/button.dart';

class Changempin extends StatefulWidget {
  const Changempin({Key? key}) : super(key: key);

  @override
  State<Changempin> createState() => _ChangempinState();
}

class _ChangempinState extends State<Changempin> {
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

  List<FocusNode> _focusNodes2 =
      List<FocusNode>.generate(4, (index) => FocusNode());
  List<TextEditingController> _controllers2 =
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
    for (var i = 0; i < _controllers2.length - 1; i++) {
      _controllers2[i].addListener(() {
        if (_controllers2[i].text.length == 1) {
          _focusNodes2[i + 1].requestFocus();
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
    for (var i = 0; i < _focusNodes2.length; i++) {
      _focusNodes2[i].dispose();
      _controllers2[i].dispose();
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
        title: Text('Change MPIN'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  'Old MPIN',
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
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  'New MPIN',
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
                      focusNode: _focusNodes1[1],
                      controller: _controllers1[1],
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
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  'Confirm New MPIN',
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
                      focusNode: _focusNodes2[0],
                      controller: _controllers2[0],
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
                      focusNode: _focusNodes2[1],
                      controller: _controllers2[1],
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
                      focusNode: _focusNodes2[2],
                      controller: _controllers2[2],
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
                      focusNode: _focusNodes2[3],
                      controller: _controllers2[3],
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
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
