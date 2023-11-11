// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chaam/widgets/helper.dart';
import 'package:flutter/material.dart';

class Profiles extends StatelessWidget {
  const Profiles({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: CachedNetworkImageProvider(image),
    );
  }
}
