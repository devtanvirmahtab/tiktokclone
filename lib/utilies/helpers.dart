import 'dart:io';
import 'package:flutter/material.dart';

import '../views/screens/home/add_video_screen.dart';

const pageList = [
    Text("Home"),
    Text("Search"),
    AddVideoScreen(),
    Text("Messages"),
    Text("Profile"),
];

ImageProvider getCallProfileImage(String? imageUrl) {
  if (imageUrl == null || imageUrl == "") {
    return const AssetImage("assets/images/avatar.png");
  }
  return NetworkImage(
    imageUrl,
    scale: 1,
  );
}

ImageProvider getProfileImage(String? path, String? fallback) {
  if (path == null || path == "") {
    return getCallProfileImage(fallback);
  }
  return FileImage(
    File(
      path,
    ),
  );
}