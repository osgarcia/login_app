import 'package:flutter/material.dart';

class LoadingScreem extends StatelessWidget {
  const LoadingScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.indigo,
        ),
      ),
    );
  }
}
