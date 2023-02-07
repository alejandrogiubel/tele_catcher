## Features

Catch your errors and send it to telegram

## Getting started

Add tele_catcher to your pubspec.yaml
```yaml
dependencies:
  tele_catcher: ^1.1.0
```

```yaml
dependencies:
  tele_catcher:
      git: https://github.com/alejandrogiubel/tele_catcher
```

## Usage

First you need to create a telegram bot with BotFather in order to get the bot token, them you can start the bot in private chat or group chat.
In order to get the chat id read
https://stackoverflow.com/questions/32423837/telegram-bot-how-to-get-a-group-chat-id

Init tele_catcher in your main function
```dart
await TeleCatcher.start('1111111111:aqwdergydsghbnhytyjuhf304-dkmtihndeyu58', 000000000);
```

Send report
```dart
TeleCatcher.sendError('This is a simple message');
```

If you want a global error catcher and send the report to TeleCatcher
```dart
FlutterError.onError = (details) {
    TeleCatcher.sendError(details.toString());
  };
```

## Additional information

PR are welcome
