import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/login_page.dart';

void main(){
  testWidgets('test textfield if displayed', (WidgetTester tester) async{
    await tester.pumpWidget(LoginPage());

    expect(find.byType(TextField), findsWidgets);
    expect(find.text('Login').first, findsWidgets);
  });
}