// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class KeyboardDismissibleView extends StatelessWidget {
  const KeyboardDismissibleView({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: child,
    );
  }
}
