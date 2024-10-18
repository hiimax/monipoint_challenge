

import 'package:monipoint_challenge/app/service_locator.dart';
import 'package:monipoint_challenge/env/development.dart';
import 'package:monipoint_challenge/env/env_fields.dart';
import 'package:monipoint_challenge/env/production.dart';
import 'package:monipoint_challenge/env/staging.dart';

enum AppEnvironment { dev, staging, prod }

abstract interface class Env implements EnvFields {
  factory Env() => _instance;

  static final Env _instance = switch (locator<AppEnvironment>()) {
    AppEnvironment.dev => DevEnv(),
    AppEnvironment.staging => QaEnv(),
    AppEnvironment.prod => ProdEnv(),
  };
}
