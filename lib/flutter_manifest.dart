library flutter_manifest;

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'src/web_manifest.dart';
export 'src/web_manifest.dart';

/// Provides web manifest information. manifest.json file must be in assets.
/// ```dart
/// WebManifest manifest = await Manifest.read()
/// print("Version is: ${manifest.version}");
/// ```
class Manifest {
  /// Retrieves manifest information from the manifest.json.
  static Future<Map<String, dynamic>> readJson() async {
    try {
      String manifestJson = await rootBundle.loadString('manifest.json');
      return json.decode(manifestJson);
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// Retrieves manifest information from the manifest.json.
  static Future<WebManifest> read() async {
    final json = await Manifest.readJson();
    if (json != null) {
      return WebManifest.fromJson(json);
    }
    return null;
  }
}
