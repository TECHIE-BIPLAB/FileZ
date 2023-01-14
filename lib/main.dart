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
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        backgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(),
      ),
      home: const HomePage(),
    );
  }
}
