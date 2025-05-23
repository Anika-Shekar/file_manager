import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const FileManagerApp());
}

class FileManagerApp extends StatelessWidget {
  const FileManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Manager',
      theme: ThemeData.dark(),
      home: const FileManagerHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}