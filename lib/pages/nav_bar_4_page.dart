import 'package:apphud/apphud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_guide_257/auth_pages/auth_page.dart';
import 'package:model_guide_257/images/app_generate_images.dart';
import 'package:model_guide_257/main.dart';
import 'package:model_guide_257/pages/navig_page.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar4Page extends StatelessWidget {
  const NavBar4Page({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
          color: Colors.black,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 21.h),
            SettWidget(
              icon: AppGenerateImages.prIcon,
              title: 'Privacy Policy',
              onTap: () {
                launchUrl(
                  Uri.parse(
                    'https://www.termsfeed.com/live/32b425c6-67ea-448e-8580-796118468566',
                  ),
                );
              },
            ),
            SettWidget(
              icon: AppGenerateImages.trIcon,
              title: 'Terms of Use',
              onTap: () {
                launchUrl(
                  Uri.parse(
                    'https://www.termsfeed.com/live/9c50659f-8818-401b-9d2c-6f7863e2e7e7',
                  ),
                );
              },
            ),
            SettWidget(
              icon: AppGenerateImages.spIcon,
              title: 'Support',
              onTap: () {
                launchUrl(
                  Uri.parse(
                    'https://sites.google.com/view/fashionfans/support-form',
                  ),
                );
              },
            ),
            SettWidget(
              icon: AppGenerateImages.rsIcon,
              title: 'Restore',
              onTap: () async {
                final hasPremiumAccess = await Apphud.hasPremiumAccess();
                final hasActiveSubscription =
                    await Apphud.hasActiveSubscription();
                if (hasPremiumAccess || hasActiveSubscription) {
                  await asfasfasfafs.setBool('jsakfhaf', true);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Success!'),
                      content: const Text('Your purchase has been restored!'),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const NavigPage(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text('Ok'),
                        ),
                      ],
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Restore purchase'),
                      content: const Text(
                          'Your purchase is not found. Write to support: https://sites.google.com/view/pureaura/support-form'),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () => {Navigator.of(context).pop()},
                          child: const Text('Ok'),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            SettWidget(
              icon: AppGenerateImages.rsIcon,
              title: 'Logout',
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                await asfasfasfafs.clear();
                await asfasfasfafs.setBool('isOpened', true);
                await calHive.clear();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthPage(),
                  ),
                  (protected) => false,
                );
              },
            ),
            SettWidget(
              icon: AppGenerateImages.dlIcon,
              title: 'Delete account',
              onTap: () {
                showAdaptiveDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    content: const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(
                        "Are you sure you want to delete the account?",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: const Text(
                          "No",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoDialogAction(
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFF0000),
                          ),
                        ),
                        onPressed: () async {
                          await FirebaseAuth.instance.currentUser!.delete();
                          CollectionReference firestore =
                              FirebaseFirestore.instance.collection('users');
                          firestore
                              .doc(asfasfasfafs.getString('email'))
                              .delete();
                          asfasfasfafs.clear();
                          asfasfasfafs.setBool('isOpened', true);
                          calHive.clear();
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthPage(),
                            ),
                            (protected) => false,
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettWidget extends StatelessWidget {
  const SettWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final String icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 44.h,
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                color: Colors.black,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
