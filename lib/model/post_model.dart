import 'dart:convert';

import 'package:project/model/user_model.dart';

class PostModel {
  final UserModel user;
  final String postId;
  final String timeAgo;
  final int likes;
  final int comments;
  final int shares;
  final String imageUrl;
  final String caption;

  PostModel({
    required this.user,
    required this.postId,
    required this.timeAgo,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.imageUrl,
    required this.caption,
  });

  PostModel copyWith({
    UserModel? user,
    String? postId,
    String? timeAgo,
    int? likes,
    int? comments,
    int? shares,
    String? imageUrl,
    String? caption,
  }) {
    return PostModel(
      user: user ?? this.user,
      postId: postId ?? this.postId,
      timeAgo: timeAgo ?? this.timeAgo,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      shares: shares ?? this.shares,
      imageUrl: imageUrl ?? this.imageUrl,
      caption: caption ?? this.caption,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'postId': postId,
      'timeAgo': timeAgo,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'imageUrl': imageUrl,
      'caption': caption,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      postId: map['postId'] as String,
      timeAgo: map['timeAgo'] as String,
      likes: map['likes'] as int,
      comments: map['comments'] as int,
      shares: map['shares'] as int,
      imageUrl: map['imageUrl'] as String,
      caption: map['caption'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(user: $user, postId: $postId, timeAgo: $timeAgo, likes: $likes, comments: $comments, shares: $shares, imageUrl: $imageUrl, caption: $caption,)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.user == user &&
        other.postId == postId &&
        other.timeAgo == timeAgo &&
        other.likes == likes &&
        other.comments == comments &&
        other.shares == shares &&
        other.imageUrl == imageUrl &&
        other.caption == caption;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        postId.hashCode ^
        timeAgo.hashCode ^
        likes.hashCode ^
        comments.hashCode ^
        shares.hashCode ^
        imageUrl.hashCode ^
        caption.hashCode;
  }
}
