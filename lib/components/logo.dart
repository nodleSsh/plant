import 'package:flutter/cupertino.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage(
            'lib/images/logo4.png',
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
          text: const TextSpan(
            text: 'My',
            style: TextStyle(
                color: Color(0xFF757575),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: 'PLANT',
                style: TextStyle(color: Color(0xFF004643)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
