import 'package:flutter/material.dart';

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue, // List of Sliders
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  // return List<Item>.generate(numberOfItems, (int index) {
  //   return Item(
  //     headerValue: 'Panel $index',
  //     expandedValue: 'This is item number $index',
  //   );
  // }
  // );

  List<Item> settings = [
    Item(
      headerValue: '',
      expandedValue: '',
    ),
  ];

  return settings;
}

/// This is the stateful widget that the main application instantiates.
class SliderExpansionPanel extends StatefulWidget {
  const SliderExpansionPanel({Key? key}) : super(key: key);

  @override
  State<SliderExpansionPanel> createState() => _SliderExpansionPanelState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SliderExpansionPanelState extends State<SliderExpansionPanel> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
