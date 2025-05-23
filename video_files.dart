import 'package:flutter/material.dart';

class VideoFilesPage extends StatelessWidget {
  const VideoFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final videos = [
      {'name': 'Movie.mp4', 'type': 'MP4 Video', 'icon': Icons.videocam},
      {'name': 'Clip.mov', 'type': 'MOV Video', 'icon': Icons.videocam},
      {'name': 'Lecture.mkv', 'type': 'MKV Video', 'icon': Icons.videocam},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Videos')),
      body: ListView.separated(
        itemCount: videos.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final video = videos[index];
          return ListTile(
            leading: Icon(video['icon'] as IconData),
            title: Text(video['name'] as String),
            subtitle: Text(video['type'] as String),
            trailing: const Icon(Icons.more_vert),
          );
        },
      ),
    );
  }
}
