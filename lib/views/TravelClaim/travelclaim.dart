import 'package:flutter/material.dart';
import 'package:iemmobile/views/TravelClaim/accomadationdetails.dart';
import 'package:iemmobile/views/TravelClaim/attachments.dart';
import 'package:iemmobile/views/TravelClaim/attachmentslist.dart';
import 'package:iemmobile/views/TravelClaim/coadetails.dart';
import 'package:iemmobile/views/TravelClaim/conveyancedetails.dart';
import 'package:iemmobile/views/TravelClaim/employeedetails.dart';
import 'package:iemmobile/views/TravelClaim/paymentdetails.dart';
import 'package:iemmobile/views/TravelClaim/travelclaims.dart';
import 'package:iemmobile/views/dashboard.dart';
import 'package:iemmobile/views/TravelClaim/fooddetails.dart';
import 'package:iemmobile/views/TravelClaim/invoicesummary.dart';
import 'package:iemmobile/views/TravelClaim/otherinfo.dart';
import 'package:iemmobile/views/TravelClaim/othersdetails.dart';
import 'package:iemmobile/views/TravelClaim/traveldetails.dart';
import 'package:iemmobile/widgets/button.dart';
import 'package:iemmobile/widgets/customcolors.dart';
import 'dart:ui';

class TravelClaim extends StatefulWidget {
  const TravelClaim({Key? key}) : super(key: key);

  @override
  State<TravelClaim> createState() => _TravelClaimState();
}

class _TravelClaimState extends State<TravelClaim>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabs = ['Tab 1', 'Tab 2', 'Tab 3', 'Tab4', 'Tab5'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Replace with the actual number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Travel Claim'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.home_outlined,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => dashboard()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.sort_sharp,
                size: 35,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.filter_alt,
                size: 35,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.0,
            ), // Add space between AppBar and TabBar
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.green,
              tabs: [
                Tab(icon: Image.asset('assets/images/details.png')),
                Tab(icon: Image.asset('assets/images/emplist.png')),
                Tab(icon: Image.asset('assets/images/payment.png')),
                Tab(icon: Image.asset('assets/images/summary.png')),
                Tab(icon: Image.asset('assets/images/attach.png')),
                // Add more tabs as needed
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  detailsTab(tabController: _tabController),
                  emplistTab(),
                  paymentTab(),
                  summaryTab(),
                  attachTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class detailsTab extends StatefulWidget {
  final TabController tabController;
  const detailsTab({Key? key, required this.tabController}) : super(key: key);

  @override
  State<detailsTab> createState() => _detailsTabState();
}

class _detailsTabState extends State<detailsTab> {
  List<ExpandableCardItem> cardItems = [
    ExpandableCardItem(
      label: 'Nature Of Expense',
      text: 'Populate',
      label1: 'Expense Category',
      text1: 'Populate',
      label2: 'Sub Category',
      text2: 'Populate',
      label3: 'Amount',
      text3: 'Populate',
    ),

    // Add more card items as needed
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = widget.tabController;
    return SingleChildScrollView(
      child: Column(
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
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TravelDetails()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/travel.png',
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(height: 20),
                        Text('Travel')
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccomDetails()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/accom.png',
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(height: 20),
                        Text('Accomodation')
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FoodDetails()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/food.png',
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(height: 20),
                        Text('Food')
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConveyDetails()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/convey.png',
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(height: 20),
                        Text('Conveyance')
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OthersDetails()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/others.png',
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(height: 20),
                        Text('Others')
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
            width: 40,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(
                    color: Colors.black54,
                    width: 1.0), // Set the border color and width
              ),
              child: ExpansionPanelList(
                elevation: 3,
                expandedHeaderPadding: EdgeInsets.all(0),
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    cardItems[index].isExpanded = !isExpanded;
                  });
                },
                children:
                    cardItems.map<ExpansionPanel>((ExpandableCardItem item) {
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text('Details'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.blue,
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.green,
                                onPressed: () {},
                              ),
                            ],
                          ));
                    },
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildLabelAndText(item.label, item.text),
                        buildLabelAndText(item.label1, item.text1),
                        buildLabelAndText(item.label2, item.text2),
                        buildLabelAndText(item.label3, item.text3),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CoaDetails()),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/coa.png',
                                            width: 60,
                                            height: 60,
                                          ),
                                          SizedBox(height: 20),
                                          Text('COA')
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InvoiceSummary()),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/invoice.png',
                                            width: 60,
                                            height: 60,
                                          ),
                                          SizedBox(height: 20),
                                          Text('Invoice')
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OtherInfo()),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/otherinfo.png',
                                            width: 60,
                                            height: 60,
                                          ),
                                          SizedBox(height: 20),
                                          Text('Other Info')
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Attachments()),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/attachments.png',
                                            width: 60,
                                            height: 60,
                                          ),
                                          SizedBox(height: 20),
                                          Text('Attachments')
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    isExpanded: item.isExpanded,
                  );
                }).toList(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 100,
                child: CustomButton(
                    backgroundColor: iemColor.customColor,
                    text: 'Proceed',
                    onPressed: () {
                      _tabController.animateTo(1);
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget buildLabelAndText(String label, String text) {
  return Padding(
    padding: EdgeInsets.all(9.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text),
      ],
    ),
  );
}

class ExpandableCardItem {
  final String label;
  final String text;
  final String label1;
  final String text1;
  final String label2;
  final String text2;
  final String label3;
  final String text3;
  bool isExpanded;

  ExpandableCardItem({
    required this.label,
    required this.text,
    required this.label1,
    required this.text1,
    required this.label2,
    required this.text2,
    required this.label3,
    required this.text3,
    this.isExpanded = false,
  });
}

class emplistTab extends StatefulWidget {
  const emplistTab({Key? key}) : super(key: key);

  @override
  State<emplistTab> createState() => _emplistTabState();
}

class _emplistTabState extends State<emplistTab> {
  List<ExpandableCardItem> cardItems = [
    ExpandableCardItem(
      label: 'Employee Code',
      text: 'Populate',
      label1: 'Employee Name',
      text1: 'Populate',
      label2: 'Employee Branch',
      text2: 'Populate',
      label3: 'Amount',
      text3: 'Populate',
    ),
    ExpandableCardItem(
      label: 'Employee Code',
      text: 'Populate',
      label1: 'Employee Name',
      text1: 'Populate',
      label2: 'Employee Branch',
      text2: 'Populate',
      label3: 'Amount',
      text3: 'Populate',
    ),
    // Add more card items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [Text('# Of Employees Travelled')],
              ),
              Row(
                children: [
                  SizedBox(width: 4),
                  Container(
                    width: 40,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.save,
                      size: 40,
                    ),
                    color: Colors.green,
                    onPressed: () {},
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmployeeDetails()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/addemp.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 20),
                        Text('Add Employee')
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(),
            child: Column(
              children: cardItems.asMap().entries.map<Widget>((entry) {
                final index = entry.key;
                final item = entry.value;
                return Container(
                  margin: EdgeInsets.only(
                      bottom: 1.0), // Adjust the spacing between cards
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: Colors.black54,
                        width: 1.0,
                      ),
                    ),
                    child: ExpansionPanelList(
                      elevation: 2,
                      expandedHeaderPadding: EdgeInsets.all(0),
                      expansionCallback: (int itemIndex, bool isExpanded) {
                        setState(() {
                          item.isExpanded = !isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text('Details'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    color: Colors.blue,
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Colors.green,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            );
                          },
                          body: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              buildLabelAndText(item.label, item.text),
                              buildLabelAndText(item.label1, item.text1),
                              buildLabelAndText(item.label2, item.text2),
                              buildLabelAndText(item.label3, item.text3),
                            ],
                          ),
                          isExpanded: item.isExpanded,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class paymentTab extends StatefulWidget {
  const paymentTab({Key? key}) : super(key: key);

  @override
  State<paymentTab> createState() => _paymentTabState();
}

class _paymentTabState extends State<paymentTab> {
  List<ExpandableCardItem> cardItems = [
    ExpandableCardItem(
      label: 'Payment Mode',
      text: 'Populate',
      label1: 'Ref No.',
      text1: 'Populate',
      label2: 'Beneficiary',
      text2: 'Populate',
      label3: 'Payment Amount',
      text3: 'Populate',
    ),
    ExpandableCardItem(
      label: 'Payment Mode',
      text: 'Populate',
      label1: 'Ref No.',
      text1: 'Populate',
      label2: 'Beneficiary',
      text2: 'Populate',
      label3: 'Payment Amount',
      text3: 'Populate',
    ),
    // Add more card items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(right: 120)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentDetails()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/addpayment.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 20),
                        Text('Add Payment')
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(),
            child: Column(
              children: cardItems.asMap().entries.map<Widget>((entry) {
                final index = entry.key;
                final item = entry.value;
                return Container(
                  margin: EdgeInsets.only(
                      bottom: 1.0), // Adjust the spacing between cards
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: Colors.black54,
                        width: 1.0,
                      ),
                    ),
                    child: ExpansionPanelList(
                      elevation: 2,
                      expandedHeaderPadding: EdgeInsets.all(0),
                      expansionCallback: (int itemIndex, bool isExpanded) {
                        setState(() {
                          item.isExpanded = !isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text('Details'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    color: Colors.blue,
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Colors.green,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            );
                          },
                          body: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              buildLabelAndText(item.label, item.text),
                              buildLabelAndText(item.label1, item.text1),
                              buildLabelAndText(item.label2, item.text2),
                              buildLabelAndText(item.label3, item.text3),
                            ],
                          ),
                          isExpanded: item.isExpanded,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class summaryTab extends StatefulWidget {
  const summaryTab({Key? key}) : super(key: key);

  @override
  State<summaryTab> createState() => _summaryTabState();
}

class _summaryTabState extends State<summaryTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          SizedBox(height: 10.0),
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text('Description'),
                      SizedBox(width: 30),
                      Container(
                        width: 240,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text('Period From'),
                      SizedBox(width: 30),
                      Container(
                        width: 240,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text('Period To'),
                      SizedBox(width: 47),
                      Container(
                        width: 240,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 240,
          ),
          Column(
            children: [
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
                            backgroundColor: Colors.blue,
                            text: 'Save',
                            onPressed: () {}),
                      )
                    ],
                  ),
                  Row(children: [
                    Container(
                      height: 40,
                      width: 100,
                      child: CustomButton(
                          backgroundColor: Colors.green,
                          text: 'SUbmit',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TravelClaims()));
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
                                    builder: (context) => TravelClaims()));
                          }),
                    )
                  ])
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class attachTab extends StatefulWidget {
  const attachTab({Key? key}) : super(key: key);

  @override
  State<attachTab> createState() => _attachTabState();
}

class _attachTabState extends State<attachTab> {
  List<ExpandableCardItem> cardItems = [
    ExpandableCardItem(
      label: 'Type',
      text: 'Populate',
      label1: 'Description',
      text1: 'Populate',
      label2: 'Attached Date',
      text2: 'Populate',
      label3: 'Attached By',
      text3: 'Populate',
    ),
    ExpandableCardItem(
      label: 'Type',
      text: 'Populate',
      label1: 'Description',
      text1: 'Populate',
      label2: 'Attached Date',
      text2: 'Populate',
      label3: 'Attached By',
      text3: 'Populate',
    ),
    // Add more card items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(right: 120)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AttachmentsList()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/attach.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 20),
                        Text('Add Attachments')
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(),
            child: Column(
              children: cardItems.asMap().entries.map<Widget>((entry) {
                final index = entry.key;
                final item = entry.value;
                return Container(
                  margin: EdgeInsets.only(
                      bottom: 1.0), // Adjust the spacing between cards
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: Colors.black54,
                        width: 1.0,
                      ),
                    ),
                    child: ExpansionPanelList(
                      elevation: 2,
                      expandedHeaderPadding: EdgeInsets.all(0),
                      expansionCallback: (int itemIndex, bool isExpanded) {
                        setState(() {
                          item.isExpanded = !isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text('Details'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    color: Colors.blue,
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Colors.green,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            );
                          },
                          body: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              buildLabelAndText(item.label, item.text),
                              buildLabelAndText(item.label1, item.text1),
                              buildLabelAndText(item.label2, item.text2),
                              buildLabelAndText(item.label3, item.text3),
                            ],
                          ),
                          isExpanded: item.isExpanded,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
