// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    final fieldEmail = find.byValueKey('fieldEmail');
    final fieldPhone = find.byValueKey('fieldPhone');
    final fieldSubmit = find.text('Отправить');

    test('test email field', () async {
      await driver!.tap(fieldEmail);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('test@test.com');
      await driver!.waitFor(find.text('test@test.com'));
    });
    test('test phone field', () async {
      await driver!.tap(fieldPhone);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('+79086662229');
      await driver!.waitFor(find.text('+79086662229'));
    });

    test('test submit', () async {
      await driver!.tap(fieldSubmit);
    });

    test('Добро пожаловать', () async {
      final success = find.text('Добро пожаловать');
      expect(await driver!.getText(success), 'Добро пожаловать');
    });
  });

  group('Rigister form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    final fieldEmail = find.byValueKey('fieldEmail');
    final fieldPhone = find.byValueKey('fieldPhone');
    final fieldFirstName = find.byValueKey('fieldFirstName');
    final fieldLastName = find.byValueKey('fieldLastName');
    final fieldSubmit = find.text('Отправить');
    test('test FirstName field', () async {
      await driver!.tap(fieldFirstName);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('Yuri');
      await driver!.waitFor(find.text('Yuri'));
    });

    test('test LastName field', () async {
      await driver!.tap(fieldLastName);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('Kataev');
      await driver!.waitFor(find.text('Kataev'));
    });

    test('test email field', () async {
      await driver!.tap(fieldEmail);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('test@test.com');
      await driver!.waitFor(find.text('test@test.com'));
    });
    test('test phone field', () async {
      await driver!.tap(fieldPhone);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('89086662229');
      await driver!.waitFor(find.text('89086662229'));
    });

    test('test submit', () async {
      await driver!.tap(fieldSubmit);
    });

    test('Вы успешно зарегистрировались', () async {
      final success = find.text('Вы успешно зарегистрировались');
      expect(await driver!.getText(success), 'Вы успешно зарегистрировались');
    });
  });
}
