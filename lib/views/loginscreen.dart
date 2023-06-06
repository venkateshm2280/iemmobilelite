import 'package:flutter/material.dart';
import 'package:iemmobile/views/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedRadio = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(5.0),
          child: Image.asset('assets/images/logoiem.png'),
        ),
        title: Text('iEM Lite'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 82.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 0,
                        groupValue: selectedRadio,
                        onChanged: (int? value) {
                          setState(() {
                            selectedRadio = value!;
                          });
                        }),
                    Text('User ID'),
                    Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (int? value) {
                          setState(() {
                            selectedRadio = value!;
                          });
                        }),
                    Text('MPIN')
                  ],
                ),
                if (selectedRadio == 0) Form1(),
                if (selectedRadio == 1) Form2(),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Form1 extends StatefulWidget {
  const Form1({Key? key}) : super(key: key);

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  final _formfield = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obsecuretext = true;
  List<String> loginMode = ['Proxy', 'Self'];
  String? selloginMode;

  void _togglePwdVisibility() {
    setState(() {
      _obsecuretext = !_obsecuretext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formfield,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'User ID',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextFormField(
              obscureText: _obsecuretext,
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_obsecuretext
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: _togglePwdVisibility,
                  ),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock)),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Login Mode',
                border: OutlineInputBorder(),
              ),
              child: SizedBox(
                height: 20.0, // Adjust the height as per your requirement
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selloginMode,
                    onChanged: (String? newValue) {
                      setState(() {
                        selloginMode = newValue!;
                        print('Selected Value: $selloginMode');
                      });
                    },
                    items: loginMode.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_formfield.currentState!.validate()) {
                  String username = usernameController.text;
                  String password = passwordController.text;
                  // Perform login logic for Form 1
                  print('Form 1 - Username: $username, Password: $password');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dashboard()));
                }
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}

class Form2 extends StatefulWidget {
  const Form2({Key? key}) : super(key: key);

  @override
  State<Form2> createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  final _formfield = GlobalKey<FormState>();
  final useridController = TextEditingController();
  final passwordController = TextEditingController();
  List<FocusNode> _focusNodes =
      List<FocusNode>.generate(4, (index) => FocusNode());
  List<TextEditingController> _controllers =
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
  }

  @override
  void dispose() {
    for (var i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].dispose();
      _controllers[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formfield,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextFormField(
              controller: useridController,
              decoration: InputDecoration(
                  labelText: 'User ID',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a User ID';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'MPIN',
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: TextField(
                  focusNode: _focusNodes[0],
                  controller: _controllers[0],
                  autofocus: true,
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
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_formfield.currentState!.validate()) {
                  String userid = useridController.text;
                  String password = passwordController.text;
                  // Perform login logic for Form 2
                  print('Form 2 - User ID: $userid, Password: $password');
                }
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
