import 'package:flutter/material.dart';

class BottomLinkWidget extends StatelessWidget {
  final String Linktext;
  final String text;
  final navigate;

  const BottomLinkWidget({
    super.key,
    required this.Linktext,
    required this.text,
    required this.navigate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyle(fontSize: 10)),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return navigate;
                },
              ),
            );
          },
          child: Text(
            Linktext,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
