import 'package:flutter/material.dart';
import 'package:iemmobile/views/TravelClaim/travelclaim.dart';
import 'package:iemmobile/widgets/button.dart';
import 'package:iemmobile/widgets/customcolors.dart';

class CoaDetails extends StatefulWidget {
  const CoaDetails({Key? key}) : super(key: key);

  @override
  State<CoaDetails> createState() => _CoaDetailsState();
}

class _CoaDetailsState extends State<CoaDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _expense;

  List<String> _expenseValues = ['Expense1', 'Expense2', 'Expense3'];
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
            title: Text('Details - COA'),
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
                              Text('Business Segment'),
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
                              Text('Cost Center'),
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
                              Text('Product Code'),
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
                              Text('Location Code'),
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
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 750.0)),
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
                                          builder: (context) => TravelClaim()));
                                }),
                          )
                        ]),
                        SizedBox(
                          width: 20.0,
                        ),
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
                                          builder: (context) => TravelClaim()));
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
}
