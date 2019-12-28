import 'dart:convert';
import 'dart:io';

import 'package:flutter_manifest/utils.dart';
import 'package:flutter_test/flutter_test.dart';

final testManifest = {
  "name": "HackerWeb",
  "short_name": "HackerWeb",
  "start_url": "/",
  "display": "standalone",
  "theme_color": "#000",
  "background_color": "#E3F2FD",
  "description": "A simply readable Hacker News app.",
  "version": "0.1.0",
  "icons": [
    {
      "src": "/assets/images/icon-192.png",
      "type": "image/png",
      "sizes": "192x192",
      "purpose": "maskable any"
    },
    {
      "src": "/assets/images/icon-512.png",
      "type": "image/png",
      "sizes": "512x512",
      "purpose": "maskable any"
    }
  ]
};

void main() {
  group('utils', () {
    test('configToManifest', () {
      final manifest = {'foo': 'bar', 'override': '1'};
      final config = {
        'name': 'test',
        'description': 'test description',
        'version': '1.1.1',
        'bar': 'foo',
        'flutter_manifest': {'theme_color': 'FFF', 'override': '2'}
      };
      final result = configToManifest(manifest, config);
      expect(result['name'], config['name']);
      expect(result['short_name'], config['name']);
      expect(result['description'], config['description']);
      expect(result['version'], config['version']);
      expect(result['theme_color'], 'FFF');
      expect(result['override'], '2');
      expect(result['foo'], 'bar');
      expect(result['bar'], isNull);
    });

    test('saveManifestFile', () async {
      final path = 'test.json';
      await saveManifestFile(path, testManifest);
      final str = await File(path).readAsString();
      expect(json.decode(str), testManifest);
      await File(path).delete();
    });

    test('loadConfigFile', () {
      final config = loadConfigFile('../pubspec.yaml');
      expect(config['name'], 'flutter_manifest');
    });
  });
}
