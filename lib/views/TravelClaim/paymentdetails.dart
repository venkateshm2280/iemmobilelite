import 'package:flutter/material.dart';
import 'package:iemmobile/widgets/button.dart';
import 'package:iemmobile/widgets/customcolors.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _expense;

  List<String> _expenseValues = ['Expense1', 'Expense2', 'Expense3'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: iemColor.customColor)),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Payment Details'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ECF No.',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Populate'),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ECF Date',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Populate'),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ECF Amount',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Populate'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //SizedBox(height: 10.0),
            Form(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text('Payment Mode'),
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
                            contentPadding: EdgeInsets.symmetric(vertical: 5.0),
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
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text('Ref No. / Bank A/C No.'),
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
                            contentPadding: EdgeInsets.symmetric(vertical: 5.0),
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
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text('Beneficiary Name'),
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
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text('Payment Amount'),
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
                    height: 220,
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
                                Navigator.pop(context);
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
                                Navigator.pop(context);
                              }),
                        )
                      ])
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
