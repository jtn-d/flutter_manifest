import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_manifest/flutter_manifest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Manifest Example',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Manifest Example'),
      ),
      body: FutureBuilder(
        future: Manifest.read(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData)
            return Center(
              child: Text(JsonEncoder.withIndent('  ').convert(snapshot.data)),
            );
          else if (snapshot.hasError)
            return Center(child: Text(snapshot.data));
          else return Center(child: Text('loading'));
        },
      )
    );
  }
}
