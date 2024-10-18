// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staging.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _Env {
  static const List<int> _enviedkeybaseUrl = <int>[
    3443560478,
    2639261598,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    3443560505,
    2639261625,
  ];

  static final String baseUrl = String.fromCharCodes(List<int>.generate(
    _envieddatabaseUrl.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]));

  static const List<int> _enviedkeyapiKey = <int>[
    700915393,
    3658305327,
  ];

  static const List<int> _envieddataapiKey = <int>[
    700915430,
    3658305288,
  ];

  static final String apiKey = String.fromCharCodes(List<int>.generate(
    _envieddataapiKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]));

  static const List<int> _enviedkeysecretKey = <int>[
    2532394961,
    2934294222,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    2532394998,
    2934294249,
  ];

  static final String secretKey = String.fromCharCodes(List<int>.generate(
    _envieddatasecretKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]));

  static const List<int> _enviedkeyencryptionKey = <int>[
    1226931628,
    1165871868,
  ];

  static const List<int> _envieddataencryptionKey = <int>[
    1226931595,
    1165871835,
  ];

  static final String encryptionKey = String.fromCharCodes(List<int>.generate(
    _envieddataencryptionKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataencryptionKey[i] ^ _enviedkeyencryptionKey[i]));

  static const List<int> _enviedkeyencryptionVector = <int>[
    1278682139,
    1638523620,
  ];

  static const List<int> _envieddataencryptionVector = <int>[
    1278682172,
    1638523587,
  ];

  static final String encryptionVector = String.fromCharCodes(
      List<int>.generate(
    _envieddataencryptionVector.length,
    (int i) => i,
    growable: false,
  ).map((int i) =>
          _envieddataencryptionVector[i] ^ _enviedkeyencryptionVector[i]));

  static const List<int> _enviedkeysocketUrl = <int>[
    1353513544,
    177012580,
  ];

  static const List<int> _envieddatasocketUrl = <int>[
    1353513583,
    177012547,
  ];

  static final String socketUrl = String.fromCharCodes(List<int>.generate(
    _envieddatasocketUrl.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatasocketUrl[i] ^ _enviedkeysocketUrl[i]));
}
