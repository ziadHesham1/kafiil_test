import 'package:flutter/material.dart';
import 'service_card_widget.dart';

class ScrollableRowWidget extends StatelessWidget {
  final List<ServiceCardWidget> list;
  const ScrollableRowWidget({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list.map((item) {
          return item;
        }).toList(),
      ),
    );
  }
}
