import 'package:flutter/material.dart';
import 'package:tiktokclone/utilies/constants/constants.dart';
import 'package:tiktokclone/utilies/helpers.dart';

import '../../widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pageList[pageIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          pageIndex = value;
          setState(() {

          });
        },
        backgroundColor: backgroundColor,
        selectedItemColor: redColor,
        unselectedItemColor: whiteColor,
        currentIndex: pageIndex,
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: CustomIcon(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person",
          ),
        ],
      ),
    );
  }
}
