import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DesignPage extends StatefulWidget {
  @override
  _DesignPageState createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  //Topbar
  Widget _getTopBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
      alignment: Alignment.topLeft,
      height: 90,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //left_side
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //lock
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: Icon(
                    Icons.lock_outline_rounded,
                    color: (Colors.black),
                    size: 20,
                  ),
                ),
                SizedBox(width: 5),

                //name
                Text(
                  'blue_._addicted',
                  style: TextStyle(
                      fontFamily: 'Mandali',
                      fontWeight: FontWeight.w900,
                      fontSize: 25),
                ),

                //Dropdown arrow
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: (Colors.black),
                    size: 25,
                  ),
                ),
              ],
            ),

            //right_side
            Row(
              children: [
                //Add Icon
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      )),
                  child: Icon(
                    Icons.add,
                    color: (Colors.black),
                    size: 20,
                  ),
                ),
                SizedBox(width: 20),

                //Menu
                Container(
                  child: Icon(
                    Icons.menu,
                    color: (Colors.black),
                    size: 35,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //ProfileLine
  Widget _getProfileBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Profile Photo
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/dp.jpg'),
            ),
          ),
          SizedBox(width: 3),

          //Posts
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '112',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 5),
                Text(
                  'Posts',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(width: 15),

          //Followers
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '856',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 5),
                Text(
                  'Followers',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(width: 15),

          //Following
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '702',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 5),
                Text(
                  'Following',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
    );
  }

  //Bio
  Widget _getBio() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nik\'s Patel 💙',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizedBox(height: 3),
          Text(
            '; )deséame el 19 de agosto 🎂',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 3),
          Text(
            '•adicto al azul•💙',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  //Edit_and_save_buttons
  Widget _getProfileButtons() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 35,
              margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  )),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 35,
              margin: EdgeInsets.fromLTRB(0, 30, 20, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  )),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Saved',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  //Stories
  Widget _getStories() {
    List<int> text = [1, 2, 3, 4, 5, 6];
    List<String> caption = [
      'Saputara',
      'Lake',
      'Sunset',
      'Sunrise',
      'View',
      'Add More'
    ];
    return Container(
        padding: EdgeInsets.fromLTRB(13, 20, 2, 2),
        width: double.infinity,
        child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i in text)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        margin: EdgeInsets.fromLTRB(7, 0, 8, 0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black12, width: 1.5),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            )),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('images/$i.jpg'),
                        ),
                      ),
                      Container(child: Text(caption[i - 1]))
                    ],
                  ),
              ],
            )));
  }

  //Grid_and_tag
  Widget _getGridButton() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.black, width: 1)),
                ),
                child: Icon(Icons.grid_on_sharp)),
          ),
          Expanded(
            child: Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[200], width: 1)),
              ),
              child: Icon(
                Icons.perm_contact_cal_outlined,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //feed
  Widget _getFeed(){
    return Container(
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Image.asset('images/1.jpg'),
                ),
              ),
              SizedBox(width: 2),
              Expanded(
                child: Container(
                  child: Image.asset('images/2.jpg'),
                ),
              ),
              SizedBox(width: 2),
              Expanded(
                child: Container(
                  child: Image.asset('images/3.jpg'),
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Image.asset('images/4.jpg'),
                ),
              ),
              SizedBox(width: 2),
              Expanded(
                child: Container(
                  child: Image.asset('images/5.jpg'),
                ),
              ),
              SizedBox(width: 2),
              Expanded(
                child: Container(
                  child: Image.asset('images/dp.jpg'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _getTopBar(),
              SizedBox(height: 5),
              _getProfileBar(),
              _getBio(),
              _getProfileButtons(),
              _getStories(),
              _getGridButton(),
              _getFeed(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined,
              color: Colors.black,),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.slow_motion_video_outlined,
              color: Colors.black,),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up_off_alt,
              color: Colors.black,),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage('images/dp.jpg'),
            ),
            label: 'Profile',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
