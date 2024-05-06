import 'package:assalam/screens/authentication/log_in_page/login_page.dart';
import 'package:assalam/screens/authentication/registration_page/registration_page.dart';
import 'package:assalam/screens/settings_page/language.dart';
import 'package:assalam/screens/settings_page/notification.dart';
import 'package:assalam/screens/settings_page/profile_page.dart';
import 'package:assalam/screens/settings_page/widgets/custom_list_view_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [

            // Profile
            CustomListViewCard(
              text: 'Profile',
              image: 'assets/icons/user.png',
              icon: Icons.arrow_forward_ios,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile(),));
              },
            ),
            // Premium
            CustomListViewCard(
              text: 'Premium',
              image: 'assets/icons/premium.png',
              icon: Icons.arrow_forward_ios,
              onPressed: () {},
            ),
            // Notification
            CustomListViewCard(
              text: 'Notification',
              image: 'assets/icons/notification.png',
              icon: Icons.arrow_forward_ios,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
              },
            ),
            // Languages
            CustomListViewCard(
              text: 'Languages',
              image: 'assets/icons/language.png',
              icon: Icons.arrow_forward_ios,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TranslatorPage(),));
              },
            ),
            // Share
            CustomListViewCard(
              text: 'Share',
              image: 'assets/icons/share.png',
              icon: Icons.arrow_forward_ios,
              onPressed: () {},
            ),
            // Logout
            CustomListViewCard(
              text: 'Logout',
              image: 'assets/icons/logout.png',
              icon: Icons.arrow_forward_ios,
              onPressed: () => Get.to(RegistrationPage()),
            ),

          ],
        ),
      )),
    );
  }
}


