import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final int wordNumber;
  final int number;

  const TextWidget({
    super.key,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  (number <= wordNumber) ? title : '...',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
}
