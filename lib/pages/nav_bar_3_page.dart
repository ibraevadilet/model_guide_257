import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:model_guide_257/images/app_generate_images.dart';
import 'package:model_guide_257/main.dart';

class NavBar3Page extends StatefulWidget {
  const NavBar3Page({super.key});

  @override
  State<NavBar3Page> createState() => _NavBar3PageState();
}

class _NavBar3PageState extends State<NavBar3Page> {
  late String email;
  late String name;
  late String? avatar;
  late String? about;
  late List<String> images;

  bool isImageLoading = false;
  bool isAvatarLoading = false;

  @override
  void initState() {
    name = asfasfasfafs.getString('name') ?? '';
    avatar = asfasfasfafs.getString('avatar');
    about = asfasfasfafs.getString('about') ?? '';
    images = asfasfasfafs.getStringList('images') ?? [];
    super.initState();
  }

  TextEditingController aboutController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
          color: Colors.black,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: InkWell(
              onTap: () {
                showAdaptiveDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text(
                      "Info",
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
                        "Our platform guarantees the privacy and security of your data",
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
                          "Ok",
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
                    ],
                  ),
                );
              },
              child: Image.asset(
                AppGenerateImages.infoIcon,
                height: 32.h,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? avatarFrom =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (avatarFrom != null) {
                    setState(() {
                      isAvatarLoading = true;
                    });

                    final lists = await avatarFrom.readAsBytes();

                    String base64Image = base64Encode(lists);
                    await asfasfasfafs.setString('avatar', base64Image);
                    avatar = base64Image;
                    setState(() {
                      isAvatarLoading = false;
                    });
                  }
                },
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff00C8FF),
                  ),
                  child: isAvatarLoading
                      ? const CircularProgressIndicator.adaptive()
                      : avatar == null
                          ? const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 100,
                            )
                          : Container(
                              height: 113,
                              width: 113,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff00C8FF),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Center(
                                child: Container(
                                  height: 110,
                                  width: 110,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.memory(
                                    base64Decode(avatar!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
              width: MediaQuery.of(context).size.width,
            ),
            Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            const Divider(),
            SizedBox(height: 24.h),
            Row(
              children: [
                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    showAdaptiveDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) =>
                          StatefulBuilder(builder: (context, setState2) {
                        return CupertinoAlertDialog(
                          title: const Text(
                            "About",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          content: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Column(
                              children: [
                                const Text(
                                  "Write about yourself",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 12.h),
                                CupertinoTextField(
                                  maxLines: 10,
                                  minLines: 1,
                                  onChanged: (value) {
                                    setState2(() {});
                                  },
                                  controller: aboutController,
                                  cursorHeight: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey.shade300,
                                  ),
                                  placeholder: "Enter",
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: const Text(
                                "Exit",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                aboutController.clear();
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoDialogAction(
                              onPressed: aboutController.text.isEmpty
                                  ? null
                                  : () async {
                                      Navigator.pop(context);
                                      about = aboutController.text;
                                      asfasfasfafs.setString(
                                          'about', aboutController.text);

                                      setState(() {});
                                      aboutController.clear();
                                    },
                              child: Text(
                                "Save",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  color: aboutController.text.isEmpty
                                      ? const Color(0xff00C8FF).withOpacity(0.4)
                                      : const Color(0xff00C8FF),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                    );
                  },
                  child: Image.asset(
                    AppGenerateImages.editPen,
                    height: 18.h,
                  ),
                )
              ],
            ),
            Expanded(
              child: about == null
                  ? Center(
                      child: Text(
                        'Write about yourself',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        about!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                          color: Colors.black,
                        ),
                      ),
                    ),
            ),
            const Divider(),
            SizedBox(height: 24.h),
            Row(
              children: [
                const Text(
                  'Photos',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final List<XFile> imagesFrom =
                        await picker.pickMultiImage();
                    if (imagesFrom.isNotEmpty) {
                      setState(() {
                        isImageLoading = true;
                      });
                      List<String> saveimages = [];

                      for (var e in imagesFrom) {
                        final lists = await e.readAsBytes();

                        String base64Image = base64Encode(lists);
                        saveimages.add(base64Image);
                      }

                      images = List.from(saveimages);

                      await asfasfasfafs.setStringList('images', saveimages);

                      setState(() {
                        isImageLoading = false;
                      });
                    }
                  },
                  child: isImageLoading
                      ? const CircularProgressIndicator.adaptive()
                      : Image.asset(
                          AppGenerateImages.editPen,
                          height: 18.h,
                        ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: images.isEmpty
                  ? Center(
                      child: Text(
                        'Add your photo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: images
                            .map<Widget>(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  height: 165.h,
                                  width: 165.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.memory(
                                    base64Decode(e),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
