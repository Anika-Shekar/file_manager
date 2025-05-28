import 'package:flutter/material.dart';

class PhotoFoldersPage extends StatelessWidget {
  const PhotoFoldersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, int> photoManager = {
      "Camera": 790,
      "Download": 6,
      "Instagram": 52,
      "id's": 2,
      "documents": 16,
      "mee": 35,
      "Screenshots": 52,
      "WhatsApp": 21,
      "Restored": 11,
      "Snapchat": 78,
      "WhatsApp Documents": 9
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Folders'),
      ),
      body: ListView.builder(
        itemCount: photoManager.length,
        itemBuilder: (context, index) {
          String folderName = photoManager.keys.elementAt(index);
          int photoCount = photoManager[folderName]!;
          return ListTile(
            leading: const Icon(Icons.folder),
            title: Text(folderName),
            trailing: Text('$photoCount photos'),
          );
        },
      ),
    );
  }
}