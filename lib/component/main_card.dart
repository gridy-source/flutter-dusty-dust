import 'package:dusty_dust/const/colors.dart';
import 'package:dusty_dust/model/stat_and_status_model.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const MainCard({
    required this.child,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: backgroundColor,
      child: child,
    );
  }
}
