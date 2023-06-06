import 'package:flutter/material.dart';
import 'package:iemmobile/widgets/customcolors.dart';

class Listviewsamples extends StatelessWidget {
  const Listviewsamples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('List View')),
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
      headerValue: 'Card 1',
      label: 'Type',
      text: 'Populate',
      label1: 'Description',
      text1: 'Populate',
      label2: 'Attached Date',
      text2: 'Populate',
      label3: 'Attached By',
      text3: 'Populate',
      isExpanded: false,
    ),
    Item(
      headerValue: 'Card 2',
      label: 'Type',
      text: 'Populate',
      label1: 'Description',
      text1: 'Populate',
      label2: 'Attached Date',
      text2: 'Populate',
      label3: 'Attached By',
      text3: 'Populate',
      isExpanded: false,
    ),
    Item(
      headerValue: 'Card 3',
      label: 'Type',
      text: 'Populate',
      label1: 'Description',
      text1: 'Populate',
      label2: 'Attached Date',
      text2: 'Populate',
      label3: 'Attached By',
      text3: 'Populate',
      isExpanded: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
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

Widget buildLabelAndTextWithButtons(String label, String text) {
  return Container(
    padding: EdgeInsets.all(7.0),
    //padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(text),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Perform edit action
                  print('Edit button pressed for $label');
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
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
