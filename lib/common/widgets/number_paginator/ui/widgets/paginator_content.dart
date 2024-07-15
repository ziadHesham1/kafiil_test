import 'package:flutter/material.dart';

import '../../model/display_mode.dart';
import 'inherited_number_paginator.dart';
import 'paginator_content/number_content.dart';

class PaginatorContent extends StatelessWidget {
  final int currentPage;

  const PaginatorContent({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    var mode = InheritedNumberPaginator.of(context).config.mode;

    switch (mode) {
      case ContentDisplayMode.numbers:
        return NumberContent(
          currentPage: currentPage,
        );

      default:
        return Container();
    }
  }
}
