import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/utilies/constants/app_constants.dart';
import 'package:tiktokclone/utilies/constants/controller_constants.dart';
import 'package:tiktokclone/utilies/constants/firebase_constants.dart';

import '../models/comment_model.dart';

class CommentController extends GetxController {
  final Rx<List<Comment>> _comment = Rx<List<Comment>>([]);

  List<Comment> get comments => _comment.value;
  String _postId = "";

  updatePostId(String id) {
    _postId = id;
  }

  postComment(String commentText) async {
    try {
      if (commentText.isNotEmpty) {
            DocumentSnapshot userDoc = await fireStore
                .collection('users')
                .doc(authController.user.uid)
                .get();
            var allDocs = await fireStore
                .collection('videos')
                .doc(_postId)
                .collection('comments')
                .get();
            int len = allDocs.docs.length;
            Comment comment = Comment(
              userName: (userDoc.data()! as dynamic)['name'],
              comment: commentText.trim(),
              datePublished: DateTime.now(),
              likes: [],
              profilePhoto: (userDoc.data()! as dynamic)['profilePhoto'],
              uid: authController.user.uid,
              id: 'Comment $len',
            );

            await fireStore
                .collection('videos')
                .doc(_postId)
                .collection('comments')
                .doc('Comment $len')
                .set(
                  comment.toJson(),
                );
          }
    } catch (e) {
      Get.snackbar('Error while comments',e.toString());
      logger.e(e.toString());
    }
  }

// getComment()async{
//
// }
}
