import 'package:flutter/material.dart';

class ListKebutuhanScreen extends StatelessWidget {
  const ListKebutuhanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Kebutuhan'),
      ),
      body: ListView(),
    );
  }
}
