import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:model_guide_257/data/guides_model_data.dart';
import 'package:model_guide_257/images/app_generate_images.dart';
import 'package:model_guide_257/main.dart';
import 'package:model_guide_257/pages/guide_detail_page.dart';
import 'package:model_guide_257/pages/to_buy_page.dart';
import 'package:shimmer/shimmer.dart';

class NavBar2Page extends StatelessWidget {
  const NavBar2Page({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guides'),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
          color: Colors.black,
        ),
        centerTitle: false,
      ),
      body: MasonryGridView.count(
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 17.w,
        itemCount: guidesList.length,
        crossAxisCount: 2,
        itemBuilder: (context, index) => GuildeWidget(
          model: guidesList[index],
        ),
      ),
    );
  }
}

class GuildeWidget extends StatefulWidget {
  const GuildeWidget({
    super.key,
    required this.model,
  });

  final GuidesModel model;

  @override
  State<GuildeWidget> createState() => _GuildeWidgetState();
}

class _GuildeWidgetState extends State<GuildeWidget> {
  late bool isBuied;

  @override
  void initState() {
    isBuied = asfasfasfafs.getBool('jsakfhaf') ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isBuied && widget.model.isPrem) {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const ToBuyPage(isClose: true),
            ),
          );
        } else {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => GuideDetailPage(model: widget.model),
            ),
          );
        }
      },
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              // imageUrl: widget.model.image,
              imageUrl: image,
              placeholder: (context, url) => SizedBox(
                height: 200.h,
                width: double.infinity,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.4),
                  highlightColor: Colors.white,
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
            ),
          ),
          if (!isBuied && widget.model.isPrem)
            Positioned(
              right: 12,
              top: 12,
              child: Image.asset(
                AppGenerateImages.lockIcon,
                height: 24.h,
              ),
            ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                blendMode: BlendMode.srcOver,
                child: Container(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  clipBehavior: Clip.hardEdge,
                  height: 70.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        const Color(0xff00C8FF).withOpacity(0.3),
                        const Color(0xff00C8FF),
                      ],
                    ),
                  ),
                  child: Text(
                    widget.model.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
