import 'dart:typed_data';

class FileObject {
  const FileObject({
    this.fileName,
    this.title,
    this.icon,
  });

  final String fileName;
  final String title;
  final Uint8List icon;
}
