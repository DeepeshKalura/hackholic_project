// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:project/model/user_model.dart';

class StoryModel {
  final UserModel user;
  final String storyId;
  final String storyTitle;
  final String imageUrl;
  final bool isViewed;
  StoryModel({
    required this.user,
    required this.storyId,
    required this.storyTitle,
    required this.imageUrl,
    required this.isViewed,
  });

  StoryModel copyWith({
    UserModel? user,
    String? storyId,
    String? storyTitle,
    String? imageUrl,
    bool? isViewed,
  }) {
    return StoryModel(
      user: user ?? this.user,
      storyId: storyId ?? this.storyId,
      storyTitle: storyTitle ?? this.storyTitle,
      imageUrl: imageUrl ?? this.imageUrl,
      isViewed: isViewed ?? this.isViewed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'storyId': storyId,
      'storyTitle': storyTitle,
      'imageUrl': imageUrl,
      'isViewed': isViewed,
    };
  }

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      storyId: map['storyId'] as String,
      storyTitle: map['storyTitle'] as String,
      imageUrl: map['imageUrl'] as String,
      isViewed: map['isViewed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryModel.fromJson(String source) =>
      StoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Story(user: $user, storyId: $storyId, storyTitle: $storyTitle, imageUrl: $imageUrl, isViewed: $isViewed)';
  }

  @override
  bool operator ==(covariant StoryModel other) {
    if (identical(this, other)) return true;

    return other.user == user &&
        other.storyId == storyId &&
        other.storyTitle == storyTitle &&
        other.imageUrl == imageUrl &&
        other.isViewed == isViewed;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        storyId.hashCode ^
        storyTitle.hashCode ^
        imageUrl.hashCode ^
        isViewed.hashCode;
  }
}
