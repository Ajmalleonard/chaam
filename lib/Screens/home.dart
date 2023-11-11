// ignore_for_file: must_be_immutable

import 'package:chaam/Screens/chat.dart';
import 'package:chaam/Screens/select_user_screen.dart';
import 'package:chaam/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class Chaam extends StatefulWidget {
  final StreamChatClient client;
  const Chaam({super.key, required this.client});

  @override
  State<Chaam> createState() => _ChaamState();
}

class _ChaamState extends State<Chaam> {
  @override
  Widget build(BuildContext context) {
    return App();
  }
}

class App extends StatefulWidget {
  App({Key? key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var appTheme = AppTheme();
  int them = 1;

  void themeSwitcher() {
    setState(() {
      them == 1 ? them = 2 : them = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      theme: appTheme.light,
      builder: (context, child) => child!,
      darkTheme: appTheme.dark,
      themeMode: them == 1 ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/selected',
      getPages: [
        GetPage(
          name: '/SelectUser',
          page: () => AppController(onTap: themeSwitcher),
        ),
        GetPage(name: '/SelectUser', page: () => const SelectUser())
      ],
    );
  }
}
