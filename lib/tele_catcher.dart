library tele_catcher;

import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

/// A TeleCatcher.
class TeleCatcher {
  static late TeleDart _teledart;
  static late int _chatId;

  ///Start tele catcher bot.
  ///In order to get the chat id read
  ///https://stackoverflow.com/questions/32423837/telegram-bot-how-to-get-a-group-chat-id
  static Future<void> start(String botToken, int chatId) async {
    final username = (await Telegram(botToken).getMe()).username;
    _teledart = TeleDart(botToken, Event(username!));
    _chatId = chatId;
    _teledart.start();
  }

  static Future<void> sendError(String infoToReport) async {
    final platform = Platform.operatingSystem;
    final timeStamp = DateTime.now();
    final osVersion = Platform.operatingSystemVersion;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final appName = packageInfo.appName;
    final packageName = packageInfo.packageName;
    final version = packageInfo.version;
    final buildNumber = packageInfo.buildNumber;

    final report = '''
Hello, TeleCatcherBot reporting 🫡.
OS: $platform
OS Version: $osVersion
Time stamp: $timeStamp
App name: $appName
Package name: $packageName
App version: $version
Build number: $buildNumber
Report:
$infoToReport
    ''';
    _teledart.sendMessage(_chatId, report);
  }
}
