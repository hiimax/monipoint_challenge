import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monipoint_challenge/env/env.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  required AppEnvironment environment,
}) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    FlutterError.onError = (details) {
      log(
        details.exceptionAsString(),
        stackTrace: details.stack,
        name: details.exception.runtimeType.toString(),
      );
    };

    // await setupLocator(environment: environment);
    // await locator.get<SharedPrefs>().init();

    runApp(await builder());
  } catch (e, s) {
    log(e.toString(), name: 'bootstrap');
    log(s.toString(), name: 'bootstrap', stackTrace: s);
  }
}
