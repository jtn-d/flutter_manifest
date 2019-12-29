import 'dart:io';

import 'package:flutter_manifest/src/utils.dart';

const String _defaultConfigFile = 'pubspec.yaml';
const String _defaultManifestFile = 'manifest.json';
final _templateManifest = {
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

void main(List<String> arguments) async {
  print('Generating manifest.json');
  final config = await readYamlFile(_defaultConfigFile);
  if (config == null) {
    stderr.writeln(Exception('Check your config file $_defaultConfigFile'));
    exit(1);
  }
  final manifest = convertConfigToManifest(_templateManifest, config);
  await writeJsonFile(_defaultManifestFile, manifest);
}