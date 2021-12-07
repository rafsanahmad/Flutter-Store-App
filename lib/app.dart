import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mina_store/home.dart';
import 'package:mina_store/theme/themes.dart';

import 'login.dart';

class MinaStoreApp extends StatelessWidget {
  const MinaStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      home: const HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: appTheme,
    );
  }
}

Route<dynamic>? _getRoute(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => const LoginPage(),
    fullscreenDialog: true,
  );
}
