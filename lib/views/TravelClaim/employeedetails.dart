import 'package:flutter/material.dart';
import 'package:iemmobile/widgets/button.dart';
import 'package:iemmobile/widgets/customcolors.dart';

class EmployeeDetails extends StatefulWidget {
  const EmployeeDetails({Key? key}) : super(key: key);

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: iemColor.customColor)),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Employee Details'),
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
                            Text('Employee Code'),
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
                      SizedBox(width: 50.0),
                      Expanded(
                          child: TextFormField(
                        decoration: InputDecoration(),
                      )),
                      IconButton(
                        padding: EdgeInsets.only(top: 30),
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text('Employee Name'),
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
                            Text('Employee Branch'),
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
                            Text('Business Segment (BU)'),
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
                    height: 300,
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
