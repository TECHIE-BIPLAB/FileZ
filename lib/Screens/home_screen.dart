import 'package:file_picker/file_picker.dart';
import 'package:file_z/Screens/result_screen.dart';
import 'package:file_z/customMap/custom_magic_map.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:mime/mime.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPicked = false;

  @override
  void initState() {
    super.initState();
    CustomMap();
  }

  // this function is for to pick file from storage
  void _picker() async {
    CustomMap;
    List magicNumber = [];
    setState(() {
      isPicked = true;
    });
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;

    var filepath = result.files.first.path;
    var file = File(filepath!);

    List<int> headerBytes = await file.openRead().first;
    for (var element in headerBytes) {
      magicNumber.add('0x${element.toRadixString(16)}');
    }
    setState(() {
      isPicked = false;
    });

    final mimeType = lookupMimeType(filepath, headerBytes: headerBytes);
    final extension = extensionFromMime(mimeType!);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultScreen(
                  mimeType: mimeType,
                  extentionType: extension,
                  headCodeInDec: headerBytes.toString(),
                  headCodeInHex: magicNumber.toString(),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: isPicked
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        _picker();
                      },
                      child: Container(
                        // decoration: const BoxDecoration(
                        //     gradient: LinearGradient(colors: [
                        //   Color.fromARGB(251, 107, 123, 159),
                        //   Color.fromARGB(192, 58, 111, 89)
                        // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                        color: Colors.blueAccent,
                        height: 200,
                        width: 200,
                        child: Center(
                          child: Icon(
                            Icons.upload_file,
                            size: 100,
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
