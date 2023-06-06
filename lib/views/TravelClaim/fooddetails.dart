import 'package:flutter/material.dart';
import 'package:iemmobile/views/TravelClaim/travelclaim.dart';
import 'package:iemmobile/widgets/button.dart';
import 'package:iemmobile/widgets/customcolors.dart';
import 'package:intl/intl.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _expense;
  DateTime? _selectedDate;

  List<String> _expenseValues = ['Expense1', 'Expense2', 'Expense3'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

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
            title: Text('Details - Food'),
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
                              Text('Nature Of Expenses'),
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
                              Text('Expense Category'),
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
                              Text('Sub Category'),
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
                              Text('Amount'),
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
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('*',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red)),
                              SizedBox(width: 125.0),
                              GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  ).then((selectedDate) {
                                    setState(() {
                                      _selectedDate = selectedDate;
                                    });
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        _selectedDate != null
                                            ? DateFormat('yyyy-MM-dd')
                                                .format(_selectedDate!)
                                            : 'Select a date',
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                      ),
                                      Icon(
                                        Icons.calendar_month,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
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
                              Text('Place'),
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
                      height: 200.0,
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
                                          builder: (context) => TravelClaim()));
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
