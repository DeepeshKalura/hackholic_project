// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../../controller/firebase/comments_firebase_controller.dart';

// class CommentBottomSheet extends StatefulWidget {
//   final String postId;

//   const CommentBottomSheet({super.key, required this.postId});

//   @override
//   _CommentBottomSheetState createState() => _CommentBottomSheetState();
// }

// class _CommentBottomSheetState extends State<CommentBottomSheet> {
//   final CommentsFirebaseController _commentsController =
//       CommentsFirebaseController();
//   final TextEditingController _commentController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Add a Comment',
//             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//           ),
//           TextField(
//             controller: _commentController,
//             decoration: const InputDecoration(
//               hintText: 'Type your comment here...',
//             ),
//           ),
//           const SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: () {
//               _addComment();
//             },
//             child: const Text('Add Comment'),
//           ),
//           const SizedBox(height: 20.0),
//           const Text(
//             'Comments',
//             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//           ),
//           Expanded(
//             child: FutureBuilder(
//               future: _commentsController.getAllComments(postId: widget.postId),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   return const Text('Error loading comments');
//                 } else if (!snapshot.hasData || snapshot.data == null) {
//                   return const Text('No comments yet.');
//                 } else {
//                   // Display the comments in a ListView
//                   return _buildCommentList(snapshot.data);
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCommentList(QuerySnapshot<Object?> commentsSnapshot) {
//     return ListView.builder(
//       itemCount: commentsSnapshot.size,
//       itemBuilder: (context, index) {
//         var commentData =
//             commentsSnapshot.docs[index].data() as Map<String, dynamic>;
//         return ListTile(
//           title: Text(commentData['comment']),
//           // You can display additional information like the commenter's name, timestamp, etc.
//           // ...
//         );
//       },
//     );
//   }

//   Future<void> _addComment() async {
//     String commentText = _commentController.text.trim();
//     if (commentText.isNotEmpty) {
//       await _commentsController.addComment(
//         postId: widget.postId,
//         uid: '1',
//         comment: commentText,
//       );
//       _commentController.clear();
//     }
//   }
// }
