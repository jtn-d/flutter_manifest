import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_manifest/flutter_manifest.dart';

void main() {
  group('flutter_manifest', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      ServicesBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', (message) {
          String key = utf8.decode(message.buffer.asUint8List());
          var file = new File('../$key');
          final Uint8List encoded = utf8.encoder.convert(file.readAsStringSync());
          return Future.value(encoded.buffer.asByteData());
      });
    });
    test('should read manifest as json', () async {
      final manifest = await Manifest.readJson();
      expect(manifest['name'], isNotNull);
      expect(manifest['short_name'], isNotNull);
    });
    test('should read manifest as object', () async {
      final manifest = await Manifest.read();
      expect(manifest.name, isNotNull);
      expect(manifest.shortName, isNotNull);
    });
  });
}
