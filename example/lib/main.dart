import 'package:flutter/material.dart';
import 'package:tele_catcher/tele_catcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Init TeleCatcherBot with your own bot token and chat id
  //In order to get the chat idread
  //https://stackoverflow.com/questions/32423837/telegram-bot-how-to-get-a-group-chat-id
  await TeleCatcher.start('1111111111:aqwdergydsghbnhytyjuhf304-dkmtihndeyu58', 000000000);

  //If you want a global error catcher and send the report to TeleCatcher
  FlutterError.onError = (details) {
    TeleCatcher.sendError(details.toString());
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 5000,
                    height: 100,
                    color: Colors.red,
                  ),
                ],
              ),
              FilledButton(
                onPressed: () {
                  //Send custom message to TeleCathcerBot
                  TeleCatcher.sendError('This is a simple message');
                },
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
