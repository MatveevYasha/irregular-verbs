import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:irregular_verbs_app/data/entities/verb.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int wordNumber = 0;

  final verb = Verb(
    baseForm: 'be',
    pastSimple: 'was/were',
    pastParticiple: 'been',
    translation: 'быть',
  );

  void _scrollWords() {
    if (wordNumber < 4) {
      wordNumber++;
      setState(() {});
      return;
    } else {
      wordNumber = 0;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Irregular Verbs $wordNumber'),
      ),
      body: (wordNumber == 0)
          ? const Center(
              child: Text(
                'Click on the button to start!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          : SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _Text(
                    number: 1,
                    title: verb.baseForm,
                    wordNumber: wordNumber,
                  ),
                  const _Divider(),
                  _Text(
                    number: 2,
                    title: verb.pastSimple,
                    wordNumber: wordNumber,
                  ),
                  const _Divider(),
                  _Text(
                    number: 3,
                    title: verb.pastParticiple,
                    wordNumber: wordNumber,
                  ),
                  const _Divider(),
                  _Text(
                    number: 4,
                    title: verb.translation,
                    wordNumber: wordNumber,
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _fetchFileFromAssets,
        child: const Icon(Icons.workspaces_filled),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) => const Divider(color: Colors.black);
}

class _Text extends StatelessWidget {
  final String title;
  final int wordNumber;
  final int number;

  const _Text({
    required this.title,
    required this.wordNumber,
    required this.number,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: Row(
          children: [
            if (number != 4)
              Expanded(
                child: Text(
                  number.toString(),
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[300],
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            Expanded(
              flex: 5,
              child: Text(
                (number <= wordNumber) ? title : '...',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
