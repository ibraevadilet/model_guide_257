import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_guide_257/images/app_generate_images.dart';
import 'package:model_guide_257/pages/nav_bar_1_page.dart';
import 'package:model_guide_257/pages/nav_bar_2_page.dart';
import 'package:model_guide_257/pages/nav_bar_3_page.dart';
import 'package:model_guide_257/pages/nav_bar_4_page.dart';

class NavigPage extends StatefulWidget {
  const NavigPage({super.key, this.indexIndexFrom = 0});
  final int indexIndexFrom;

  @override
  State<NavigPage> createState() => _NavigPageState();
}

class _NavigPageState extends State<NavigPage> {
  late int currantIndex = widget.indexIndexFrom;

  final widgets = <Widget>[
    const NavBar1Page(),
    const NavBar2Page(),
    const NavBar3Page(),
    const NavBar4Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currantIndex,
        children: widgets,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => setState(() => currantIndex = 0),
                child: Image.asset(
                  AppGenerateImages.botNav1,
                  color: currantIndex == 0 ? const Color(0xff00C8FF) : null,
                  width: 32.w,
                ),
              ),
              InkWell(
                onTap: () => setState(() => currantIndex = 1),
                child: Image.asset(
                  AppGenerateImages.botNav2,
                  color: currantIndex == 1 ? const Color(0xff00C8FF) : null,
                  width: 32.w,
                ),
              ),
              InkWell(
                onTap: () => setState(() => currantIndex = 2),
                child: Image.asset(
                  AppGenerateImages.botNav3,
                  color: currantIndex == 2 ? const Color(0xff00C8FF) : null,
                  width: 32.w,
                ),
              ),
              InkWell(
                onTap: () => setState(() => currantIndex = 3),
                child: Image.asset(
                  AppGenerateImages.botNav4,
                  color: currantIndex == 3 ? const Color(0xff00C8FF) : null,
                  width: 32.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
