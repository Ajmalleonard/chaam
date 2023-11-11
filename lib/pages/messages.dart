// ignore_for_file: unused_element

import 'package:chaam/Screens/chatScreen.dart';
import 'package:chaam/models/models.dart';
import 'package:chaam/pages/profiles.dart';
import 'package:chaam/theme.dart';
import 'package:chaam/widgets/Stories.dart';
import 'package:chaam/widgets/avatar.dart';
import 'package:chaam/widgets/helper.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stories(),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(_delegate))
      ],
    );
  }

  Widget _delegate(BuildContext context, int index) {
    final date = DateTime.now();
    final Faker faker = Faker();
    return _MessagesTile(
      messageModel: MessagesModel(
        userName: faker.person.name(),
        message: faker.lorem.sentence(),
        messageTime: date,
        dateMessage: '3 Hours',
        profilePicture: Helper.randomPictureUrl(),
      ),
    );
  }
}

class _MessagesTile extends StatelessWidget {
  const _MessagesTile({super.key, required this.messageModel});

  final MessagesModel messageModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(ChatScreen.route(messageModel));
        // Get.(ChatScreen.route(messageModel));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Positioned(
                  left: 40,
                  bottom: 10,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Avatar.medium(url: Helper.randomPictureUrl()),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          messageModel.userName,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: Text(
                            messageModel.message,
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        )
                      ],
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            messageModel.dateMessage.toUpperCase(),
                            style: GoogleFonts.poppins(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 18,
                            width: 18,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondary),
                            child: Center(
                                child: Text(
                              '2',
                              style: GoogleFonts.poppins(
                                  fontSize: 10, color: AppColors.textLigth),
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
