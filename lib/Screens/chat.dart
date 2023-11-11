// ignore_for_file: camel_case_types

import 'package:chaam/pages/calls.dart';
import 'package:chaam/pages/contacts.dart';
import 'package:chaam/pages/messages.dart';
import 'package:chaam/pages/notification.dart';
import 'package:chaam/widgets/avatar.dart';
import 'package:chaam/widgets/helper.dart';
import 'package:chaam/widgets/icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppController extends StatefulWidget {
  final Function onTap;

  const AppController({Key? key, required this.onTap}) : super(key: key);

  @override
  State<AppController> createState() => _AppControllerState();
}

class _AppControllerState extends State<AppController> {
  //Pages
  final pages = const [
    MessagesPage(),
    CallsPage(),
    ContactPage(),
    NotificationPage()
  ];
  final pageTitles = const ['Messages', 'Calls', 'Contacts', 'Notifications'];
  var selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: IconBackground(
              icon: CupertinoIcons.search, onTap: () => widget.onTap),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPage = 3;
              });
            },
            child: Row(
              children: [
                const Icon(CupertinoIcons.bell),
                SizedBox(
                  width: Get.width * 0.02,
                )
              ],
            ),
          ),
          Avatar.small(url: Helper.randomPictureUrl()),
          SizedBox(
            width: Get.width * 0.02,
          )
        ],
        title: Text(pageTitles[selectedPage]),
      ),
      body: Center(child: pages[selectedPage]),
      bottomNavigationBar: selectedPage == 3
          ? Container()
          : SafeArea(
              maintainBottomViewPadding: true,
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0, right: 8, left: 8),
                child: GNav(
                  activeColor: Colors.blue,
                  rippleColor: Colors.black,
                  gap: 10,
                  iconSize: 20,
                  tabBackgroundColor: Theme.of(context).cardColor,
                  tabBorderRadius: 50,
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, right: 20, left: 20),
                  tabs: [
                    GButton(
                      onPressed: () {
                        setState(() {
                          selectedPage = 1;
                        });
                      },
                      icon: CupertinoIcons.phone,
                      text: 'Calls',
                      textStyle: GoogleFonts.poppins(fontSize: 10),
                    ),
                    GButton(
                      onPressed: () {
                        setState(() {
                          selectedPage = 0;
                        });
                      },
                      icon: CupertinoIcons.chat_bubble,
                      text: 'Messages',
                      textStyle: GoogleFonts.poppins(fontSize: 10),
                    ),
                    GButton(
                      onPressed: () {
                        setState(() {
                          selectedPage = 2;
                        });
                      },
                      icon: CupertinoIcons.profile_circled,
                      text: 'Contacts',
                      textStyle: GoogleFonts.poppins(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
