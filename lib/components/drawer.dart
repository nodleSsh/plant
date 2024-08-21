import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant/components/logo.dart';
import 'package:plant/theme/colors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF6F6F6),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const DrawerHeader(
            child: MyLogo(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Home',
                    style: ThemeColors.textMenuStyle,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/home_page');
                  },
                ),
                ListTile(
                  title: const Text(
                    'Profile',
                    style: ThemeColors.textMenuStyle,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/my_profile');
                  },
                ),
                ListTile(
                  title: const Text(
                    'My Plants',
                    style: ThemeColors.textMenuStyle,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/my_plants');
                  },
                ),
                ListTile(
                  title: const Text(
                    'Plants Library',
                    style: ThemeColors.textMenuStyle,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/plants_library');
                  },
                ),
                ListTile(
                  title: const Text(
                    'Settings',
                    style: ThemeColors.textMenuStyle,
                  ),
                  onTap: () {
                     Navigator.pushNamed(context, '/settings');
                  },
                ),
                ListTile(
                  title: const Text(
                    'Help',
                    style: ThemeColors.textMenuStyle,
                  ),
                  onTap: () {
                     Navigator.pushNamed(context, '/help_page');
                  },
                ),
                ListTile(
                  title: const Text(
                    'Log Out',
                    style: ThemeColors.textMenuStyle,
                  ),
                  onTap: () {
                    //  Navigator.pushNamed(context, '/login_page');
                    FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
