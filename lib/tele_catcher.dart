library tele_catcher;

import 'dart:io';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

/// A TeleCatcher.
class TeleCatcher {
  static late TeleDart _teledart;
  static late int _chatId;

  ///Start tele catcher bot.
  ///In order to get the chat idread
  ///https://stackoverflow.com/questions/32423837/telegram-bot-how-to-get-a-group-chat-id
  static Future<void> start(String botToken, int chatId) async {
    final username = (await Telegram(botToken).getMe()).username;
    _teledart = TeleDart(botToken, Event(username!));
    _chatId = chatId;
    _teledart.start();
    _teledart.sendMessage(chatId, 'Hello, TeleCatcherBot started 🫡');
  }

  static Future<void> sendError(String infoToReport) async {
    final platform = Platform.operatingSystem;
    final timeStamp = DateTime.now();
    final osVersion = Platform.operatingSystemVersion;
    final report = '''
Hello, TeleCatcherBot reporting 🫡.
OS: $platform
OS Version: $osVersion
Time stamp: $timeStamp
Report:
$infoToReport
    ''';
    _teledart.sendMessage(_chatId, report);
  }
}
