import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String pathImage;
  const SocialButton({super.key, required this.pathImage,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFC4C4C4),
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image(
          image: AssetImage(pathImage),
        ),
      ),
    );
  }
}
