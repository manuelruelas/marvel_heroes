import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final int value;
  final String title;
  const CounterCard({super.key, this.value = 0, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(title),
      ],
    );
  }
}
