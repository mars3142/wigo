import 'dart:typed_data';

import 'package:flutter/material.dart';

class FileTile extends StatelessWidget {
  const FileTile({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);

  final String title;
  final Uint8List icon;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final iconSize = (constraints.maxWidth - 32.0) / 5.0;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Container(
              width: iconSize,
              height: iconSize,
              child: (icon != null)
                  ? Image.memory(
                      icon,
                      fit: BoxFit.cover,
                    )
                  : SizedBox.shrink(),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Text(
                title ?? "No title",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    });
  }
}
