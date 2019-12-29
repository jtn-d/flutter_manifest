import 'dart:convert';
import 'dart:io';

import 'package:yaml/yaml.dart';

Map<String, Object> convertConfigToManifest(
    Map<String, Object> manifest, Map config) {
  manifest['name'] = config['name'];
  manifest['short_name'] = config['name'];
  manifest['description'] = config['description'];
  manifest['version'] = config['version'];
  if (config['flutter_manifest'] != null) {
    for (MapEntry<dynamic, dynamic> entry
        in config['flutter_manifest'].entries) {
      manifest[entry.key] = entry.value;
    }
  }
  return manifest;
}

Future<Map> readYamlFile(String path) async {
  final File file = File(path);
  final String yamlString = await file.readAsString();
  final Map yamlMap = loadYaml(yamlString);
  return yamlMap;
}

Future<void> writeJsonFile(String path, Map json) async {
  final File file = File(path);
  final JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  final config = encoder.convert(json);
  await file.writeAsString(config);
}
