import 'package:flutter/material.dart';

import '../widgets/posts_handler.dart';

class MovieMainScreen extends StatelessWidget {
  const MovieMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text('Posts'),
      ),
      body: const Posts(),
      backgroundColor: Colors.grey[200],
    );
  }
}
