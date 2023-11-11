import 'package:chaam/theme.dart';
import 'package:flutter/material.dart';

class IconBackground extends StatelessWidget {
  const IconBackground({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        splashColor: AppColors.textLigth,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(
            icon,
            size: 18,
          ),
        ),
      ),
    );
  }
}
