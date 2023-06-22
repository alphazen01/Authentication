import 'package:flutter/material.dart';

GlobalKey<NavigatorState>? navKey = GlobalKey();

void push({required Widget screen}) {
  Navigator.push(
    navKey!.currentContext!,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

