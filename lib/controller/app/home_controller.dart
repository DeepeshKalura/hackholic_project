import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../model/models.dart';
import '../api/current_user_api_controller.dart';
import '../api/random_url_image_controller.dart';
import '../firebase/post_firebase_controller.dart';
import '../firebase/search_user_firebase_controller.dart';
import '../firebase/upload_firebase_controller.dart';
import '../local/upload_data_from_device_local_controller.dart';

class HomeController extends ChangeNotifier {
  final _uploadFirebaseController = UploadFirebaseController();
  final _postFirebaseController = PostFirebaseController();
  final _uploadDataFromDeviceLocalController =
      UploadDataFromDeviceLocalController();

  final _randomUrlImageController = RandomUrlImageController();
  final _searchUserFirebaseController = SearchUserFirebaseController();

  Uint8List? data;

  var isSearching = false;

  List<UserModel> searchResult = [];

  final Uuid _uuid = const Uuid();
  UserModel currentUser = UserModel(
    uid: 'MVCKOyhxr2M13iqOGWKkPkWujBk2',
    email: 'maha123@gmail.com',
    name: 'mahajan',
    imageUrl:
        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  );

  final _currentUserAPIController = CurrentUserAPIController();

  void setCurrentUser(String? uid) async {
    var res = await _currentUserAPIController.setCurrentUser(uid);
    currentUser = res ?? currentUser;
    notifyListeners();
  }

  Future<void> uploadPost(
      String file, String fileName, Uint8List data, String caption) async {
    String postId = _uuid.v4();

    var postUrl =
        await _uploadFirebaseController.uploadFile(file, fileName, data);

    PostModel newPost = PostModel(
      user: currentUser,
      postId: postId,
      timeAgo: DateTime.now().toString(),
      likes: 0,
      comments: 0,
      shares: 0,
      imageUrl: postUrl,
      caption: caption,
    );

    _postFirebaseController.addPost(post: newPost, uid: postId);
  }

  Future<void> getImageFromUser(bool camera) async {
    if (camera) {
      data = await _uploadDataFromDeviceLocalController.getImageFromCamera();
      notifyListeners();
    } else {
      data = await _uploadDataFromDeviceLocalController.getImageFromGallery();
      notifyListeners();
    }
  }

  String randomPost() {
    return _randomUrlImageController.randomPost();
  }

  void clickOnSearch() {
    isSearching = !isSearching;
    notifyListeners();
  }

  void searchUser(String query) async {
    searchResult = await _searchUserFirebaseController.searchUser(query);
    notifyListeners();
  }
}
