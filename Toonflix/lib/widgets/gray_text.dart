import 'package:flutter/material.dart';

class gray_text extends StatelessWidget {
  final String text;

  const gray_text({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 30,
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
