import 'package:file_z/Screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FileZ());
}

class FileZ extends StatelessWidget {
  const FileZ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            const ColorScheme.dark().copyWith(background: Colors.black),
      ),
      home: const HomePage(),
    );
  }
}
