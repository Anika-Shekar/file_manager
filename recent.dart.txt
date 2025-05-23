import 'package:flutter/material.dart';

class RecentFilesPage extends StatelessWidget {
  const RecentFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final recentFiles = [
      {'name': 'photo1.jpg', 'type': 'Image', 'icon': Icons.image},
      {'name': 'document.pdf', 'type': 'PDF', 'icon': Icons.description},
      {'name': 'song.mp3', 'type': 'Audio', 'icon': Icons.music_note},
      {'name': 'video.mp4', 'type': 'Video', 'icon': Icons.videocam},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Recent Files')),
      body: ListView.separated(
        itemCount: recentFiles.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final file = recentFiles[index];
          return ListTile(
            leading: Icon(file['icon'] as IconData),
            title: Text(file['name'] as String),
            subtitle: Text(file['type'] as String),
            trailing: const Icon(Icons.more_vert),
          );
        },
      ),
    );
  }
}