// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/components/login_form.dart';
import 'package:testing/components/register_form.dart';

void main() {
  //group('Login view tests', () {
  testWidgets("login form test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
      body: LoginForm(),
    )));

    expect(find.byKey(const Key('fieldEmail')), findsOneWidget);
    expect(find.byKey(const Key('fieldPhone')), findsOneWidget);
    expect(find.text('Отправить'), findsOneWidget);
    expect(find.text('Добро пожаловать'), findsNothing);

    await tester.enterText(
        find.byKey(const Key('fieldEmail')), 'test@test.com');
    expect(find.text('test@test.com'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('fieldPhone')), '+79086662229');
    expect(find.text('+79086662229'), findsOneWidget);

    await tester.tap(find.text('Отправить'));
    await tester.pump();
    expect(find.text('Добро пожаловать'), findsOneWidget);
  });

  testWidgets("register form test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
      body: RegisterForm(),
    )));

    expect(find.byKey(const Key('fieldEmail')), findsOneWidget);
    expect(find.byKey(const Key('fieldPhone')), findsOneWidget);
    expect(find.byKey(const Key('fieldFirstName')), findsOneWidget);
    expect(find.byKey(const Key('fieldLastName')), findsOneWidget);
    expect(find.text('Отправить'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('fieldFirstName')), 'Yuri');
    expect(find.text('Yuri'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('fieldLastName')), 'Kataev');
    expect(find.text('Kataev'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('fieldEmail')), 'test@test.com');
    expect(find.text('test@test.com'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('fieldPhone')), '89086662229');
    expect(find.text('89086662229'), findsOneWidget);

    await tester.tap(find.text('Отправить'));
    await tester.pump();
    expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
  });
}
