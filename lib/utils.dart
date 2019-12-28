import 'dart:convert';
import 'dart:io';

import 'package:yaml/yaml.dart';

const String defaultConfigFile = 'pubspec.yaml';
const String defaultManifestFile = 'manifest.json';
final templateManifest = {
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

void generate(List<String> arguments) {
  print('Generate manifest.json');
  final config = loadConfigFile(defaultConfigFile);
  final manifest = configToManifest(templateManifest, config);
  saveManifestFile(defaultManifestFile, manifest);
}

Map<String, Object> configToManifest(Map<String, Object> manifest, Map config) {
  manifest['name'] = config['name'];
  manifest['short_name'] = config['name'];
  manifest['description'] = config['description'];
  manifest['version'] = config['version'];
  if (config['flutter_manifest'] != null) {
    for (MapEntry<dynamic, dynamic> entry in config['flutter_manifest'].entries) {
      manifest[entry.key] = entry.value;
    }
  }
  return manifest;
}

Map loadConfigFile(String path) {
  final File file = File(path);
  final String yamlString = file.readAsStringSync();
  final Map yamlMap = loadYaml(yamlString);

  if (yamlMap == null) {
    stderr.writeln(Exception('Check your config file $defaultConfigFile'));
    exit(1);
  }

  return yamlMap;
}

Future<void> saveManifestFile(String path, Map manifest) async {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  final config = encoder.convert(manifest);
  await new File(path).writeAsString(config);
}