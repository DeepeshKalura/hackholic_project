import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palette.scaffold,
      body: Center(
        child: Text('Post'),
      ),
    );
  }
}
