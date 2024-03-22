import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_guide_257/auth_pages/auth_page.dart';
import 'package:model_guide_257/components/terms_widgets.dart';
import 'package:model_guide_257/images/app_generate_images.dart';
import 'package:model_guide_257/main.dart';
import 'package:model_guide_257/pages/navig_page.dart';

class ToBuyPage extends StatefulWidget {
  const ToBuyPage({super.key, this.isClose = false});
  final bool isClose;

  @override
  State<ToBuyPage> createState() => _ToBuyPageState();
}

class _ToBuyPageState extends State<ToBuyPage> {
  bool asdasf = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Image.asset(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  AppGenerateImages.premiumImage,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: SafeArea(
                    child: InkWell(
                      onTap: () {
                        if (widget.isClose) {
                          Navigator.pop(context);
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthPage(),
                            ),
                            (protected) => false,
                          );
                        }
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 22.h),
          Expanded(
            flex: 2,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PREMIUM',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    FittedBox(
                      child: Row(
                        children: [
                          Image.asset(
                            AppGenerateImages.lockIcon,
                            height: 30,
                          ),
                          SizedBox(width: 12.w),
                          const Text(
                            'Get access to all training guides',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.w),
                    FittedBox(
                      child: Row(
                        children: [
                          Image.asset(
                            AppGenerateImages.lockIcon,
                            height: 30,
                          ),
                          SizedBox(width: 12.w),
                          const Text(
                            'Without Ads',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          asdasf = true;
                        });
                        // await asfasfasfafs.setBool('jsakfhaf', true);
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const NavigPage(),
                        //   ),
                        //   (protected) => false,
                        // );

                        final apphudPaywalls = await Apphud.paywalls();
                        print(apphudPaywalls);
                        await Apphud.purchase(
                          product:
                              apphudPaywalls?.paywalls.first.products?.first,
                        ).whenComplete(
                          () async {
                            if (await Apphud.hasPremiumAccess() ||
                                await Apphud.hasActiveSubscription()) {
                              final hasPremiumAccess =
                                  await Apphud.hasPremiumAccess();
                              final hasActiveSubscription =
                                  await Apphud.hasActiveSubscription();
                              if (hasPremiumAccess || hasActiveSubscription) {
                                await asfasfasfafs.setBool('jsakfhaf', true);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                    title: const Text('Success!'),
                                    content: const Text(
                                        'Your purchase has been restored!'),
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
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                    title: const Text('Restore purchase'),
                                    content: const Text(
                                        'Your purchase is not found. Write to support: https://sites.google.com/view/pureaura/support-form'),
                                    actions: [
                                      CupertinoDialogAction(
                                        isDefaultAction: true,
                                        onPressed: () =>
                                            {Navigator.of(context).pop()},
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const NavigPage(),
                                ),
                                (route) => false,
                              );
                            }
                          },
                        );

                        setState(() {
                          asdasf = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff00C8FF),
                        ),
                        child: asdasf
                            ? const CircularProgressIndicator.adaptive()
                            : const Text(
                                'Buy Premium for \$0,99',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    const Spacer(),
                    const TermsButtons(),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
