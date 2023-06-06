import 'package:flutter/material.dart';
import 'package:iemmobile/views/TravelClaim/attachments.dart';
import 'package:iemmobile/views/TravelClaim/travelclaim.dart';
import 'package:iemmobile/widgets/button.dart';
import 'package:iemmobile/widgets/customcolors.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

class Attachpage extends StatefulWidget {
  const Attachpage({Key? key}) : super(key: key);

  @override
  State<Attachpage> createState() => _AttachpageState();
}

class _AttachpageState extends State<Attachpage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _expense;
  List<String> _expenseValues = ['Expense1', 'Expense2', 'Expense3'];
  String? _fileName;
  List<int> _fileBytes = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(primary: iemColor.customColor)),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Attachments'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text('Type'),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: DropdownButtonFormField<String>(
                          value: _expense,
                          decoration: InputDecoration(
                              labelText: 'Select',
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 5.0),
                              isDense: true),
                          items: _expenseValues.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _expense = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select an option';
                            }
                            return null;
                          },
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text('Description'),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text('File Name'),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 95.0,
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(),
                                  controller: TextEditingController(
                                    text: _fileName ?? '',
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.0),
                              IconButton(
                                padding: EdgeInsets.only(top: 30),
                                onPressed: () {
                                  _selectFile();
                                },
                                icon: Icon(
                                  Icons.upload,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text('Date'),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text('Attached By'),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 290.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 50.0)),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 100,
                              child: CustomButton(
                                  backgroundColor: Colors.purple,
                                  text: 'Add New',
                                  onPressed: () {}),
                            )
                          ],
                        ),
                        Row(children: [
                          Container(
                            height: 40,
                            width: 100,
                            child: CustomButton(
                                backgroundColor: Colors.blue,
                                text: 'Save',
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Attachments()));
                                }),
                          )
                        ]),
                        Row(children: [
                          Container(
                            height: 40,
                            width: 100,
                            child: CustomButton(
                                backgroundColor: Colors.brown,
                                text: 'Cancel',
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Attachments()));
                                }),
                          )
                        ])
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _selectFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        setState(() {
          _fileName = file.name;
          _fileBytes = file.bytes!;
        });
      }
    } on PlatformException catch (e) {
      print('File selection failed: $e');
    }
  }
}
