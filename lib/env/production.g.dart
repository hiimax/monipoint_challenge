// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _Env {
  static const List<int> _enviedkeybaseUrl = <int>[
    41364863,
    2312602411,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    41364824,
    2312602380,
  ];

  static final String baseUrl = String.fromCharCodes(List<int>.generate(
    _envieddatabaseUrl.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]));

  static const List<int> _enviedkeyapiKey = <int>[
    1063672119,
    3209829410,
  ];

  static const List<int> _envieddataapiKey = <int>[
    1063672080,
    3209829381,
  ];

  static final String apiKey = String.fromCharCodes(List<int>.generate(
    _envieddataapiKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]));

  static const List<int> _enviedkeysecretKey = <int>[
    1344268263,
    4068980578,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    1344268224,
    4068980549,
  ];

  static final String secretKey = String.fromCharCodes(List<int>.generate(
    _envieddatasecretKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]));

  static const List<int> _enviedkeyencryptionKey = <int>[
    2440649838,
    4176660707,
  ];

  static const List<int> _envieddataencryptionKey = <int>[
    2440649801,
    4176660676,
  ];

  static final String encryptionKey = String.fromCharCodes(List<int>.generate(
    _envieddataencryptionKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataencryptionKey[i] ^ _enviedkeyencryptionKey[i]));

  static const List<int> _enviedkeyencryptionVector = <int>[
    402751142,
    350432315,
  ];

  static const List<int> _envieddataencryptionVector = <int>[
    402751105,
    350432284,
  ];

  static final String encryptionVector = String.fromCharCodes(
      List<int>.generate(
    _envieddataencryptionVector.length,
    (int i) => i,
    growable: false,
  ).map((int i) =>
          _envieddataencryptionVector[i] ^ _enviedkeyencryptionVector[i]));

  static const List<int> _enviedkeysocketUrl = <int>[
    4063355464,
    3844443758,
  ];

  static const List<int> _envieddatasocketUrl = <int>[
    4063355503,
    3844443721,
  ];

  static final String socketUrl = String.fromCharCodes(List<int>.generate(
    _envieddatasocketUrl.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatasocketUrl[i] ^ _enviedkeysocketUrl[i]));
}
