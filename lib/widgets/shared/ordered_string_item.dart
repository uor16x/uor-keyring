class OrderedStringItem {
  final int index;
  final String value;

  @override
  bool operator ==(Object other) =>
      other is OrderedStringItem && other.index == index;

  @override
  int get hashCode => index;

  OrderedStringItem(this.index, this.value);
}
