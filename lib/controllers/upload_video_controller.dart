import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/utilies/constants/firebase_constants.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  _compressedVideo(
    String videoPath,
  ) async {
    final compressVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );

    return compressVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child("videos").child(id);
    UploadTask uploadTask = ref.putFile(
      await _compressedVideo(videoPath),
    );
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnail(String videoPath) async {
      final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
      return thumbnail;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child("thumbnails").child(id);
    UploadTask uploadTask = ref.putFile(
        await _getThumbnail(videoPath),
    );
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadVideo(String title, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await fireStore.collection('users').doc(uid).get();
      //get id
      final allDocs = await fireStore.collection('videos').get();
      int length = allDocs.docs.length;
      String videoUrl = await _uploadVideoToStorage('Video $length', videoPath);
      String imageUrl = await _uploadImageToStorage('Video $length', videoPath);
      
    } catch (e) {
      print(e);
    }
  }
}
