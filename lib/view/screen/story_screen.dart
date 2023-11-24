import 'package:flutter/material.dart';

import '../../controller/api/random_url_image_controller.dart';
// import '../../model/story_model.dart';

class StoryScreen extends StatelessWidget {
  // final StoryModel story;
  const StoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final randomUrlImageController = RandomUrlImageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Container(
          child: Image.network(
            randomUrlImageController.randomPost(),
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
