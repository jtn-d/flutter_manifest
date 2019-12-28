library flutter_manifest;

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'models/web_manifest.dart';

class Manifest {
  static Future<Map<String, dynamic>> readJson() async {
    try {
      String manifestJson = await rootBundle.loadString('manifest.json');
      return json.decode(manifestJson);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<WebManifest> read() async {
    final json = await Manifest.readJson();
    if (json != null) {
      return WebManifest.fromJson(json);
    }
    return null;
  }
}
