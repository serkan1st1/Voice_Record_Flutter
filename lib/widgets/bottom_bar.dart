import 'package:flutter/material.dart';
import 'package:flutter_voice_record/pages/home_page.dart';
import 'package:flutter_voice_record/pages/records_page.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

var pageList = [const RecordAndPlay(), RecordsPage()];
int selectIndex = 0;

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_video),
            label: 'Records',
          ),
        ],
        elevation: 0,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black12,
        iconSize: 30,
        currentIndex: selectIndex,
        onTap: (value) {
          setState(() {
            selectIndex = value;
          });
        },
      ),
    );
  }
}
