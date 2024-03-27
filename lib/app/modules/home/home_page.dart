import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste BLoc'),
      ),
      body: SizedBox(
        height: 150,
        width: 150,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/listagem');
          },
          child: const Center(
            child: Text('Listagem'),
          ),
        ),
      ),
    );
  }
}
