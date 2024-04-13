import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_guide_257/components/terms_widgets.dart';
import 'package:model_guide_257/images/app_generate_images.dart';
import 'package:model_guide_257/pages/to_buy_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int currantPage = 0;
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                currantPage = value;
              },
              children: [
                Column(
                  children: [
                    Flexible(
                      child: Image.asset(
                        AppGenerateImages.info1,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    SizedBox(height: 22.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome to the App!',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Inter',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          const FittedBox(
                            child: Text(
                              'Register and create a profile with a\ndetailed description and photos',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Flexible(
                      child: Image.asset(
                        AppGenerateImages.info2,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    SizedBox(height: 22.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Training Guides',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Inter',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          const FittedBox(
                            child: Text(
                              'Guides to creating a successful profile\nand for effective use the platform',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Flexible(
                      child: Image.asset(
                        AppGenerateImages.info3,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    SizedBox(height: 22.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Calendar Schedule',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Inter',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          const FittedBox(
                            child: Text(
                              'Set a work schedule and\ntrack your planned events',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: controller, // PageController
                        count: 3,
                        effect: WormEffect(
                          activeDotColor: const Color(0xff00C8FF),
                          dotColor: Colors.black.withOpacity(0.25),
                          dotWidth: 10,
                          dotHeight: 10,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          if (currantPage == 2) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ToBuyPage(),
                              ),
                              (protected) => false,
                            );
                          } else {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        },
                        child: CircleAvatar(
                          radius: 30.r,
                          backgroundColor: const Color(0xff00C8FF),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12.h),
                  const TermsButtons(),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
