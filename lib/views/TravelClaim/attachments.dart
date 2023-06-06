import 'package:flutter/material.dart';
import 'package:iemmobile/views/TravelClaim/attachpage.dart';
import 'package:iemmobile/views/TravelClaim/travelclaim.dart';

class Attachments extends StatefulWidget {
  const Attachments({Key? key}) : super(key: key);

  @override
  State<Attachments> createState() => _AttachmentsState();
}

class _AttachmentsState extends State<Attachments> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Attachments'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 35,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TravelClaim()),
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
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 140.0)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Attachpage()));
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/attach.png',
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(height: 20),
                            Text('Add Attachments')
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(),
                child: ExpansionPanelList(
                  elevation: 2,
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
                        ],
                      ),
                      isExpanded: item.isExpanded,
                    );
                  }).toList(),
                ),
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
