import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_guide_257/main.dart';
import 'package:model_guide_257/pages/navig_page.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsButtons extends StatelessWidget {
  const TermsButtons({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            launchUrl(
              Uri.parse(
                'https://www.termsfeed.com/live/9c50659f-8818-401b-9d2c-6f7863e2e7e7',
              ),
            );
          },
          child: Text(
            'Term of Service',
            style: TextStyle(
              fontSize: 15.h,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: color ?? Colors.black.withOpacity(0.4),
              decoration: TextDecoration.underline,
              decorationColor: color ?? Colors.black.withOpacity(0.4),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 1,
          height: 15.h,
          color: color ?? Colors.black.withOpacity(0.4),
        ),
        const Spacer(),
        InkWell(
          onTap: () async {
            final hasPremiumAccess = await Apphud.hasPremiumAccess();
            final hasActiveSubscription = await Apphud.hasActiveSubscription();
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
          child: Text(
            'Restore',
            style: TextStyle(
              fontSize: 15.h,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: color ?? Colors.black.withOpacity(0.4),
              decoration: TextDecoration.underline,
              decorationColor: color ?? Colors.black.withOpacity(0.4),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 1,
          height: 15.h,
          color: color ?? Colors.black.withOpacity(0.4),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            launchUrl(
              Uri.parse(
                'https://www.termsfeed.com/live/32b425c6-67ea-448e-8580-796118468566',
              ),
            );
          },
          child: Text(
            'Privacy Policy',
            style: TextStyle(
              fontSize: 15.h,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: color ?? Colors.black.withOpacity(0.4),
              decoration: TextDecoration.underline,
              decorationColor: color ?? Colors.black.withOpacity(0.4),
            ),
          ),
        ),
      ],
    );
  }
}
