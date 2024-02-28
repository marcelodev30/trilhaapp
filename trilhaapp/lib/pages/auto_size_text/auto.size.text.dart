import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeTextPage extends StatefulWidget {
  const AutoSizeTextPage({super.key});

  @override
  State<AutoSizeTextPage> createState() => _AutoSizeTextPageState();
}

class _AutoSizeTextPageState extends State<AutoSizeTextPage> {
  var Controller = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auto Size Text')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          children: [
            TextField(
              controller: Controller,
              maxLines: 5,
              onChanged: (value) {
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            const Text('Text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox(height: 20),
            Controller.text.isNotEmpty
                ? Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: AutoSizeText(
                        Controller.text,
                        maxLines: 3,
                        minFontSize: 16,
                      ),
                    ),
                  )
                : const Center(),
          ],
        ),
      ),
    );
  }
}
