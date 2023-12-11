import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktokclone/models/user_model.dart';
import 'package:tiktokclone/utilies/constants/app_constants.dart';
import 'package:tiktokclone/utilies/constants/firebase_constants.dart';
import 'package:tiktokclone/views/screens/auth/login_screen.dart';
import 'package:tiktokclone/views/screens/home/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  final imagePath = "".obs;
  User get user => _user.value!;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    if(user == null){
      Get.offAll(()=>LoginScreen());
    }else{
      Get.offAll(()=>HomeScreen());
    }
  }

  //pick image;
  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      Get.snackbar("Success", "Picked image Success");
      imagePath.value = pickedImage.path;
    }

  }

  //upload image to firebase storage
  Future<String> _uploadImageToFirebaseStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child("profilePics")
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  //register the user
  Future<void> registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        //save your to fireStore
        UserCredential credential =  await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadImageToFirebaseStorage(image);
        logger.w("image upload to firestore $downloadUrl");
        UserModel user = UserModel(
          name: username,
          email: email,
          profilePhoto: downloadUrl,
          uid: credential.user!.uid,
        );
        await fireStore.collection("users").doc(credential.user!.uid).set(user.toJson());
      }else{
        Get.snackbar("Error", "Please Enter All The Field");
      }
      Get.snackbar("Success", "Account created Successfully ");
    } catch (e) {
      Get.snackbar("Error Creating Account", e.toString());
    }
  }

  Future<void> loginUser(String email,String password) async {
    try{
      if(email.isNotEmpty && password.isNotEmpty){
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        logger.w("login success");
        Get.offAll(HomeScreen());
      }else{
        Get.snackbar("Error", "Please Enter all fields");
      }
    }on FirebaseException catch (e){
      logger.w("login Error ${e.toString()}");
      Get.snackbar("Error", e.toString());
    }
  }
}
