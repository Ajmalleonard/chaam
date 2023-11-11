import 'package:cached_network_image/cached_network_image.dart';
import 'package:chaam/pages/profiles.dart';
import 'package:chaam/theme.dart';
import 'package:chaam/widgets/helper.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Stories extends StatelessWidget {
  Stories({super.key});

  final List images = [
    'assets/portrait-young-woman-with-hair-bun-wearing-denim-shirt_273609-12253.jpg.avif',
    'assets/portrait-arrogant-sassy-confident-young-stylish-woman-glasses_1258-28238.jpg',
    'assets/pretty-hispanic-woman-feeling-confused-doubtful-wondering-trying-choose-make-decision_1194-390623.jpg',
    'assets/surprised-touched-bottom-heart-asian-young-girl-feeling-delighted-receive-awesome-gift-press-hands-chest-grateful-smiling-amused-express-excitement-gratitude-white-wall_176420-37182.jpg.avif',
    'assets/young-cheerful-man-wearing-eyeglasses-black-hat-smiling-looking-aside-copyspace-isolated-yellow-wall_171337-111086.jpg.avif',
    'assets/young-handsome-man-pressing-lips-together-with-cute-fun-happy-lovely-expression-sending-kiss_1194-37678.jpg.avif'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Center(
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'Stories',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      // itemCount: images.length ,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Expanded(
                              child: Profiles(
                                image: Helper.randomPictureUrl(),
                              ),
                            ),
                            Text(
                              faker.person.name(),
                              style: GoogleFonts.poppins(fontSize: 10),
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
