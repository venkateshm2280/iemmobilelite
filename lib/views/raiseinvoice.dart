import 'package:flutter/material.dart';
import 'package:iemmobile/widgets/button.dart';
import 'package:iemmobile/widgets/customcolors.dart';

class RaiseInvoice extends StatelessWidget {
  const RaiseInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Raise Invoice'),
          centerTitle: true,
          backgroundColor: iemColor.customColor,
        ),
        body: CardList(),
      ),
    );
  }
}

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List<Item> _items = [
    Item(
      headerValue: 'Card1',
      label: 'Invoice No.',
      text: 'Populate',
      label1: 'Invoice Date',
      text1: 'Populate',
      label2: 'Invoice Amount',
      text2: 'Populate',
      label3: 'Vendor Name',
      text3: 'Populate',
      label4: 'GST Charged (Y/N)',
      text4: 'Populate',
      isExpanded: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Color customcolor = Theme.of(context).colorScheme.primary;
    return SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  'ECF No.',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  width: 150.0,
                ),
                Center(
                    child: Text(
                  'Populate',
                  style: TextStyle(fontSize: 15.0),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  'ECF Amount',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  width: 150.0,
                ),
                Center(
                    child: Text(
                  'Populate',
                  style: TextStyle(fontSize: 15.0),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                  backgroundColor: customcolor,
                  text: 'Add Invoice',
                  onPressed: () {})
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                Item item = _items[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
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
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text('Invoice Details'),
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
                            buildLabelAndText(item.label4, item.text4),
                          ],
                        ),
                        isExpanded: item.isExpanded,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 1.0);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            height: 80,
            width: 360,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(5.0)),
            child: Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.credit_card),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Expense Details')
                  ],
                ),
                SizedBox(
                  width: 70.0,
                ),
                Column(
                  children: [
                    Icon(Icons.credit_card),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('RCM')
                  ],
                ),
                SizedBox(
                  width: 70.0,
                ),
                Column(
                  children: [
                    Icon(Icons.currency_rupee),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Payment')
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
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
  String label4;
  String text4;
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
    required this.label4,
    required this.text4,
    required this.isExpanded,
  });
}
