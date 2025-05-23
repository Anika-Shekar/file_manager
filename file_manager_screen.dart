import 'package:flutter/material.dart';
import 'photo_folders.dart';
import 'document_files.dart';
import 'video_files.dart';

class FileManagerScreen extends StatelessWidget {
  const FileManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Files'),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Storage Bar
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('All files', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                const Text('94.5 GB / 128 GB'),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: 94.5 / 128,
                  backgroundColor: Colors.grey.shade800,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ],
            ),
          ),

          // Categories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                FileCategory(
                  icon: Icons.image,
                  label: 'Photos',
                  count: 1167,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhotoFoldersPage(),
                      ),
                    );
                  },
                ),
                FileCategory(
                  icon: Icons.videocam,
                  label: 'Videos',
                  count: 49,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoFilesPage(),
                      ),
                    );
                  },
                ),
                const FileCategory(
                    icon: Icons.music_note,
                    label: 'Audio',
                    count: 0,
                    onTap: null),
                FileCategory(
                  icon: Icons.description,
                  label: 'Documents',
                  count: 33,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DocumentFilesPage(),
                      ),
                    );
                  },
                ),
                const FileCategory(
                    icon: Icons.android, label: 'APKs', count: 0, onTap: null),
                const FileCategory(
                    icon: Icons.archive,
                    label: 'Archives',
                    count: 0,
                    onTap: null),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Sources', style: TextStyle(fontSize: 18)),
          ),
          const Expanded(
            child: SourceList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.cleaning_services),
      ),
    );
  }
}

class FileCategory extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final VoidCallback? onTap;

  const FileCategory({
    super.key,
    required this.icon,
    required this.label,
    required this.count,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 32),
              const SizedBox(height: 8),
              Text(label),
              Text('$count', style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}

class SourceList extends StatelessWidget {
  const SourceList({super.key});

  @override
  Widget build(BuildContext context) {
    final sources = [
      {'icon': Icons.bluetooth, 'label': 'Bluetooth'},
      {'icon': Icons.download, 'label': 'Downloads'},
    ];

    return ListView.separated(
      itemCount: sources.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(sources[index]['icon'] as IconData),
          title: Text(sources[index]['label'] as String),
          onTap: () {},
        );
      },
    );
  }
}