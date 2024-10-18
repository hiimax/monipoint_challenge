import 'dart:async';

import 'package:monipoint_challenge/app/app.dart';
import 'package:monipoint_challenge/app/bootstrap.dart';
import 'package:monipoint_challenge/env/env.dart';

void main() async {
  // await setupLocator(environment: AppEnvironment.dev);
  unawaited(
    bootstrap(
      () => const MoniePoint(),
      environment: AppEnvironment.prod,
    ),
  );
}
