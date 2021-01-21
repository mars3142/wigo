import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freewig/freewig.dart';

import 'file_tile.dart';
import 'model/file_object.dart';

class FileBrowser extends StatefulWidget {
  @override
  _FileBrowserState createState() => _FileBrowserState();
}

class _FileBrowserState extends State<FileBrowser> {
  final files = <FileObject>[];

  @override
  void initState() {
    super.initState();

    _loadFiles();
  }

  Future<void> _loadFiles() async {
    final manifestJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final fileNames = jsonDecode(manifestJson)
        .keys
        .where((String key) => key.startsWith('gwc/'))
        .toList();

    for (final fileName in fileNames) {
      final data = await rootBundle.load(fileName);
      final bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      final cartridge = parseData(bytes);
      final fileObject = FileObject(
        fileName: fileName,
        title: cartridge.cartridgeName,
        icon: cartridge.splashScreen?.data,
      );
      files.add(fileObject);
    }
    files.sort((left, right) => left.title.compareTo(right.title));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wherigo Files"),
      ),
      body: Scrollbar(
        child: ListView.separated(
          padding: EdgeInsets.only(
            top: 16.0,
            bottom: 16.0 + MediaQuery.of(context).padding.bottom,
          ),
          itemCount: files.length,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (context, index) {
            final object = files[index];
            return FileTile(
              title: object.title,
              icon: object.icon,
            );
          },
        ),
      ),
    );
  }
}
