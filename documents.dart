import 'package:flutter/material.dart';

class DocumentFilesPage extends StatelessWidget {
  const DocumentFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final documents = [
      {'name': 'Resume.pdf', 'type': 'PDF', 'icon': Icons.picture_as_pdf},
      {'name': 'Notes.docx', 'type': 'Word Document', 'icon': Icons.description},
      {'name': 'Presentation.pptx', 'type': 'PPT', 'icon': Icons.slideshow},
      {'name': 'Report.xlsx', 'type': 'Excel Sheet', 'icon': Icons.table_chart},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Documents')),
      body: ListView.separated(
        itemCount: documents.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final doc = documents[index];
          return ListTile(
            leading: Icon(doc['icon'] as IconData),
            title: Text(doc['name'] as String),
            subtitle: Text(doc['type'] as String),
            trailing: const Icon(Icons.more_vert),
          );
        },
      ),
    );
  }
}