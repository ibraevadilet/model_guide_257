import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_guide_257/data/guides_model_data.dart';
import 'package:model_guide_257/images/app_generate_images.dart';
import 'package:share_plus/share_plus.dart';

class GuideDetailPage extends StatelessWidget {
  const GuideDetailPage({super.key, required this.model});
  final GuidesModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guide'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
          color: Colors.black,
        ),
        iconTheme: IconThemeData(size: 30.w),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 60),
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: model.image,
              placeholder: (context, url) =>
                  const CircularProgressIndicator.adaptive(),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          model.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 26.w),
                      InkWell(
                        onTap: () => Share.share(model.image),
                        child: Image.asset(
                          AppGenerateImages.shareIcon,
                          height: 24.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.w),
                  const Divider(),
                  SizedBox(height: 20.w),
                  Text(
                    model.desc,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      color: Colors.black,
                      height: 2,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
