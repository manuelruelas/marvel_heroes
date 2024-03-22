import 'package:flutter/material.dart';

class HeroListPage extends StatelessWidget {
  const HeroListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return const ListTile(
              title: Text("Nombre de heroe"),
            );
          }),
    );
  }
}
