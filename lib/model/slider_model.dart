// stores ExpansionPanel state information
class Item {
  Item({
    required this.headerValue,
    required this.expandedValue, // List of Sliders in a single panel
    this.isExpanded = false,
  });

  String headerValue;
  double expandedValue;
  bool isExpanded;
}
