import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../controller/api/data.dart';
import '../../controller/app/home_controller.dart';
import '../../controller/routes/routes_name.dart';
import '../../model/models.dart';
import '../theme/app_theme.dart';
import '../widget/circle.dart';
import '../widget/contact_list.dart';
import '../widget/create_post_container.dart';
import '../widget/more_optional_list.dart';
import '../widget/post_container.dart';
import '../widget/responsive.dart';
import '../widget/rooms.dart';
import '../widget/stores.dart';

class HomeScreen extends StatefulWidget {
  final String? uid;
  const HomeScreen({super.key, required this.uid});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeController>(context);
    homeProvider.setCurrentUser(widget.uid);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(
            scrollController: _trackingScrollController,
            currentUser: homeProvider.currentUser,
          ),
          desktop: _HomeScreenDesktop(
            scrollController: _trackingScrollController,
            currentUser: homeProvider.currentUser,
          ),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  final UserModel currentUser;

  const _HomeScreenMobile({
    Key? key,
    required this.scrollController,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // developer.log("homeProvider");
    final homeProvider = Provider.of<HomeController>(context, listen: false);

    Widget searching() {
      if (homeProvider.isSearching) {
        return SizedBox(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onSubmitted: (value) {
              developer.log("onSubmitted");
              developer.log(value);

              homeProvider.searchUser(value);

              value = "";

              developer.log(homeProvider.searchResult.toString());

              Navigator.pushNamed(context, RoutesName.searchScreen, arguments: {
                'users': homeProvider.searchResult,
                'scrollController': scrollController,
              });
            },
          ),
        );
      } else {
        return const Text(
          'NinjaHub',
          style: TextStyle(
            color: Palette.facebookBlue,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          ),
        );
      }
    }

    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: searching(),
          centerTitle: false,
          floating: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () {
                  //
                  developer.log('Search');
                  homeProvider.clickOnSearch();
                },
              ),
            ),
            //   CircleButton(
            //     icon: MdiIcons.facebookMessenger,
            //     iconSize: 30.0,
            //     onPressed: () {
            //       //
            //       developer.log('Messenger');
            //     },
            //   ),
          ],
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        // SliverPadding(
        //   padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
        //   sliver: SliverToBoxAdapter(
        //     child: Rooms(onlineUsers: onlineUsers),
        //   ),
        // ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final PostModel post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  final UserModel currentUser;

  const _HomeScreenDesktop({
    Key? key,
    required this.scrollController,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final PostModel post = posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
