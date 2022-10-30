// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:usuarios/home/home_page.dart';

void mail() {
  testWidgets('Filter Mens', (WidgetTester widgetTester) async {
    when((p0) => false, () {});
    await widgetTester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));
  });
}
