import 'package:flutter/material.dart';

import 'feature/file_browser/file_browser.dart';

class WigoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wigo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FileBrowser(),
    );
  }
}
