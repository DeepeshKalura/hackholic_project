import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/view/widget/circle.dart';
import '../../controller/app/home_controller.dart';
import '../../controller/routes/routes_name.dart';
import '../../model/user_model.dart';
import 'profile_avatar.dart';
import 'responsive.dart';

class CreatePostContainer extends StatefulWidget {
  final UserModel currentUser;

  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  State<CreatePostContainer> createState() => _CreatePostContainerState();
}

class _CreatePostContainerState extends State<CreatePostContainer> {
  final TextEditingController _textEditingController = TextEditingController();
  var loading = false;
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    final homeProvider = Provider.of<HomeController>(context);

    return loading
        ? const SizedBox(
            height: 60,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Card(
            margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
            elevation: isDesktop ? 1.0 : 0.0,
            shape: isDesktop
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))
                : null,
            child: Container(
              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      ProfileAvatar(imageUrl: widget.currentUser.imageUrl),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          controller: _textEditingController,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'What\'s on your mind?',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      CircleButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });

                          // upload post and give
                          if (_textEditingController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please Enter Some Text'),
                              ),
                            );
                          } else {
                            await homeProvider.uploadPost(
                              'posts/images/${homeProvider.currentUser.uid}/${DateTime.now().microsecondsSinceEpoch}.png',
                              '${DateTime.now().microsecondsSinceEpoch}.png',
                              homeProvider.data!,
                              _textEditingController.text,
                            );

                            setState(() {
                              loading = false;
                            });

                            // toast for success
                            homeProvider.data = null;

                            _textEditingController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Post Uploaded Successfully'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                        icon: Icons.send,
                        iconSize: 25,
                      ),
                    ],
                  ),
                  const Divider(height: 10.0, thickness: 0.5),
                  if (homeProvider.data != null)
                    Center(
                      child: SizedBox(
                        child: Image.memory(
                          homeProvider.data!,
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            // TODO: Take a Camera Photo From Here and

                            homeProvider.getImageFromUser(true);
                            developer.log("camera");
                          },
                          icon: const Icon(
                            Icons.video_camera_back,
                            color: Colors.red,
                          ),
                          label: const Text('Camera'),
                        ),
                        const VerticalDivider(width: 8.0),
                        TextButton.icon(
                          onPressed: () {
                            homeProvider.getImageFromUser(false);
                            developer.log('Photo');
                          },
                          icon: const Icon(
                            Icons.photo_library,
                            color: Colors.green,
                          ),
                          label: const Text('Photo'),
                        ),
                        const VerticalDivider(width: 8.0),
                        TextButton.icon(
                          onPressed: () {
                            developer.log("Game Screen");
                            Navigator.pushNamed(context, RoutesName.gameScreen);
                          },
                          icon: const Icon(
                            Icons.video_call,
                            color: Colors.purpleAccent,
                          ),
                          label: const Text('Game'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
