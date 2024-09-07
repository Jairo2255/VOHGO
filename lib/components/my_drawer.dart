import 'package:fisrt_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:fisrt_app/components/my_drawer_tile.dart';
import 'package:fisrt_app/pages/settings_page.dart';
import 'package:fisrt_app/themes/themed_logo.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // App logo
          const Padding(
            padding:  EdgeInsets.only(top: 100.0),
            child:  ThemedLogo(
              lightModeAsset: "assets/Logo_light.svg",
              darkModeAsset: "assets/Logo_dark.svg",
              width: 100,
              height: 100,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          // Home list title
          MyDrawerTile(
              text: "H O M E",
              icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // Settings list title
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
              },
          ),

          const Spacer(),

          // logout list title
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.login,
            onTap: logout,
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}