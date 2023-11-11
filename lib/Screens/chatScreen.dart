import 'package:chaam/models/messageModel.dart';
// ignore: unused_import
import 'package:chaam/theme.dart';
import 'package:chaam/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  static Route route(MessagesModel data) => MaterialPageRoute(
      builder: (context) => ChatScreen(
            message: data,
          ));

  const ChatScreen({super.key, required this.message});

  final MessagesModel message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 60,
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(
              icon: CupertinoIcons.back,
              onTap: () {
                Get.back();
              },
            ),
          ),
          title: _AppTitle(
            data: message,
          ),
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).cardColor),
              child: Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconBackground(
                          icon: CupertinoIcons.video_camera, onTap: () {}),
                      const SizedBox(
                        width: 10,
                      ),
                      IconBackground(icon: CupertinoIcons.phone, onTap: () {})
                    ]),
              )),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(child: _Chats()),
              SafeArea(
                top: false,
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(CupertinoIcons.camera_fill),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 20,
                            width: 2,
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          height: Get.height * 0.04,
                          width: Get.width * 0.5,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, top: 10.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: TextField(
                                textAlign: TextAlign.start,
                                autocorrect: true,
                                style: GoogleFonts.poppins(fontSize: 12),
                                decoration: const InputDecoration(
                                    hintText: 'Type something...',
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: IconBackground(
                            icon: Icons.send,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  ListView _Chats() {
    return ListView(
      children: const [
        _DateLabel(label: 'Yesterday'),
        _MessageTile(message: 'message', time: '12:00 Pm'),
        _MessageOwnTile(
          message: 'Hello My baby... 😍😍😍😍',
          time: '13:00 Pm',
        ),
        _MessageTile(message: 'How the Project Goes Darling 😍', time: '13:03'),
        _MessageTile(
            message: 'I think I have time for party🎉 tonight! ',
            time: '13:02'),
        _MessageOwnTile(
            message: 'Oh! Really where Are you, right now!', time: '13:04'),
        _MessageTile(
            message:
                'Home , just prepare my presentation for next project, wanna come ',
            time: '13:02'),
        _MessageOwnTile(message: 'Oh! Yeah I do , ', time: '13:04'),
      ],
    );
  }
}

class _DateLabel extends StatelessWidget {
  const _DateLabel({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textFaded),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppTitle extends StatelessWidget {
  const _AppTitle({required this.data});

  final MessagesModel data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: Get.width * 0.02,
          ),
          Avatar.medium(url: data.profilePicture),
          SizedBox(
            width: Get.width * 0.03,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.userName,
                style: GoogleFonts.poppins(fontSize: 10),
              ),
              Text(
                'online Now',
                style: GoogleFonts.poppins(fontSize: 7, color: Colors.green),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({required this.message, required this.time});
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(0),
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Padding(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Text(message),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              time,
              style: GoogleFonts.poppins(fontSize: 9),
            ),
          )
        ],
      ),
    );
  }
}

class _MessageOwnTile extends StatelessWidget {
  const _MessageOwnTile({required this.message, required this.time});
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(0))),
            child: Padding(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Text(message),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              time,
              style: GoogleFonts.poppins(fontSize: 9),
            ),
          )
        ],
      ),
    );
  }
}
