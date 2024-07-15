import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/config.dart';
import '../inherited_number_paginator.dart';

class PaginatorButton extends StatelessWidget {
  /// Callback for button press.
  final VoidCallback? onPressed;

  /// The child of the button.
  final Widget child;

  /// Whether the button is currently selected.
  final bool selected;

  /// Creates an instance of [PaginatorButton].
  const PaginatorButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final config = InheritedNumberPaginator.of(context).config;
    return SizedBox(
      width: 32.w,
      height: 32.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: newMethod(config),
          backgroundColor: _backgroundColor(context, selected),
          foregroundColor: _foregroundColor(context, selected),
          textStyle: config.buttonTextStyle,
          padding: config.buttonPadding,
        ),
        child: child,
      ),
    );
  }

  OutlinedBorder newMethod(NumberPaginatorUIConfig config) {
    if (config.buttonShape == null) {
      return const CircleBorder();
    } else {
      if (selected) {
        return config.buttonShape!
            .copyWith(side: const BorderSide(color: Colors.transparent));
      } else {
        return config.buttonShape!;
      }
    }
  }

  Color? _backgroundColor(BuildContext context, bool selected) => selected
      ? (InheritedNumberPaginator.of(context)
              .config
              .buttonSelectedBackgroundColor ??
          Theme.of(context).colorScheme.secondary)
      : InheritedNumberPaginator.of(context)
          .config
          .buttonUnselectedBackgroundColor;

  Color? _foregroundColor(BuildContext context, bool selected) => selected
      ? (InheritedNumberPaginator.of(context)
              .config
              .buttonSelectedForegroundColor ??
          Colors.white)
      : InheritedNumberPaginator.of(context)
          .config
          .buttonUnselectedForegroundColor;
}
