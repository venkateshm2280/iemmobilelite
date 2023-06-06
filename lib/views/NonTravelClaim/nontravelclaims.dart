import 'package:flutter/material.dart';
import 'package:iemmobile/views/dashboard.dart';
import 'package:iemmobile/views/TravelClaim/travelclaim.dart';
import 'package:iemmobile/widgets/button.dart';
import 'package:iemmobile/widgets/customcolors.dart';

class NonTravelClaims extends StatelessWidget {
  const NonTravelClaims({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color customColor = Theme.of(context).colorScheme.primary;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: iemColor.customColor)),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
                kToolbarHeight + 60.0), // Adjust the height value
            child: Container(
              color: customColor, // Set the background color here
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors
                        .transparent, // Make the AppBar background transparent
                    title: Text('Non Travel Claims'),
                    centerTitle: true,
                    leading: IconButton(
                      icon: Icon(
                        Icons.home_outlined,
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => dashboard()));
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
                      )
                    ],
                  ),
                  SizedBox(height: 10.0), // Add space between AppBar and TabBar
                  TabBar(
                    tabs: const [
                      Tab(
                        text: 'My Transactions',
                      ),
                      Tab(
                        text: 'My Approvals',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [Tab1Page(), Tab2Page()],
          ),
        ),
      ),
    );
  }
}

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> {
  List<Item> _items = [
    Item(
      headerValue: 'Card 1',
      label: 'ECF No.',
      text: 'Populate',
      label1: 'ECF Type',
      text1: 'Populate',
      label2: 'ECF Amount',
      text2: 'Populate',
      label3: 'Attached By',
      text3: 'Populate',
      isExpanded: false,
    ),
    Item(
      headerValue: 'Card 2',
      label: 'ECF No.',
      text: 'Populate',
      label1: 'ECF Type',
      text1: 'Populate',
      label2: 'ECF Amount',
      text2: 'Populate',
      label3: 'Attached By',
      text3: 'Populate',
      isExpanded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 70.0,
                width: 10.0,
              ),
              CustomButton(
                  backgroundColor: iemColor.customColor,
                  text: 'Raise New Column',
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TravelClaim()));
                    });
                  })
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    Item item = _items[index];
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.blue, width: 4))),
                      child: ExpansionPanelList(
                        elevation: 1,
                        expandedHeaderPadding: EdgeInsets.all(0),
                        expansionCallback: (int panelIndex, bool isExpanded) {
                          setState(() {
                            item.isExpanded = !isExpanded;
                          });
                        },
                        children: [
                          ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: Text('Claim Details'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      color: Colors.blue,
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.remove_red_eye_sharp),
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
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 6.0);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 290.0,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    color: Colors.purple,
                    child: Center(
                        child: Text(
                      '05',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    color: Colors.orange,
                    child: Center(
                        child: Text(
                      '03',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    color: Colors.green,
                    child: Center(
                        child: Text(
                      '15',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    color: Colors.pink,
                    child: Center(
                        child: Text(
                      '08',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    color: Colors.blue,
                    child: Center(
                        child: Text(
                      '04',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 10,
                        color: Colors.purple,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Center(child: Text('Draft'))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 10,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Center(child: Text('In Progress'))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 10,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Center(child: Text('Approved'))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 10,
                        color: Colors.pink,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Center(child: Text('Rejected'))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 10,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Center(child: Text('Paid'))
                    ],
                  )
                ],
              ),
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

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Item {
  String headerValue;
  String label;
  String text;
  String label1;
  String text1;
  String label2;
  String text2;
  String label3;
  String text3;
  bool isExpanded;

  Item({
    required this.headerValue,
    required this.label,
    required this.text,
    required this.label1,
    required this.text1,
    required this.label2,
    required this.text2,
    required this.label3,
    required this.text3,
    required this.isExpanded,
  });
}
