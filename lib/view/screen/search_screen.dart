import 'package:flutter/material.dart';
import 'package:project/view/theme/app_theme.dart';

import '../../model/user_model.dart';

class SearchScreen extends StatelessWidget {
  final List<UserModel> users;
  final TrackingScrollController scrollController;
  const SearchScreen(
      {super.key, required this.users, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: false,
        title: const Text(
          "Search Or  Friends",
          style: TextStyle(
            color: Palette.facebookBlue,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return UserContainer(user: user);
        },
      ),
    );
  }
}

class UserContainer extends StatefulWidget {
  const UserContainer({super.key, required this.user});
  final UserModel user;

  @override
  State<UserContainer> createState() => _UserContainerState();
}

class _UserContainerState extends State<UserContainer> {
  var isFriendRequestSent = false;
  String text = 'Add Friend';

  void textString() {
    if (isFriendRequestSent) {
      text = 'Friend Request Sent';
    } else {
      text = "Add Friend";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Palette.scaffold,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.network(
                  widget.user.imageUrl,
                ),
              ),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.user.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    widget.user.email,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Palette.facebookBlue,
              ),
            ),
            onPressed: () {
              // sendFriendRequest();
              isFriendRequestSent = true;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Friend Request Sent'),
                  duration: Duration(seconds: 4),
                ),
              );

              textString();
            },
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
