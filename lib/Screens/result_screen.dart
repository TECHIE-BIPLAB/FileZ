import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ResultScreen extends StatefulWidget {
  final String extentionType;
  final String mimeType;
  final String headCodeInDec;
  final String headCodeInHex;
  const ResultScreen(
      {super.key,
      required this.mimeType,
      required this.extentionType,
      required this.headCodeInDec,
      required this.headCodeInHex});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<void> _deleteCacheDir() async {
    var tempDir = await getTemporaryDirectory();

    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _deleteCacheDir();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'EXTENTION TYPE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  widget.extentionType,
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 14, 162, 216)),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'MIME TYPE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'MIME TYPE',
                            style: TextStyle(fontSize: 20),
                          ),
                          content: SizedBox(
                            height: 80,
                            width: 500,
                            child: Center(
                              child: Text(
                                widget.mimeType,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    widget.mimeType,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'HEX VALUES',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 460,
                  width: 370,
                  child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Scrollbar(
                          interactive: true,
                          child: SingleChildScrollView(
                              child: Text(widget.headCodeInHex)),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
