import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:model_guide_257/auth_pages/auth_page.dart';
import 'package:model_guide_257/auth_pages/servieces/fb_auth_service.dart';
import 'package:model_guide_257/components/auth_text_field.dart';
import 'package:model_guide_257/components/terms_widgets.dart';
import 'package:model_guide_257/images/app_generate_images.dart';
import 'package:model_guide_257/main.dart';
import 'package:model_guide_257/pages/navig_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool isLoading = false;

  String? avatar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00C8FF),
      bottomNavigationBar: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: TermsButtons(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 36.h),
                      InkWell(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          avatar = image?.path;
                          setState(() {});
                        },
                        child: avatar != null
                            ? Container(
                                height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Image.file(
                                  File(avatar!),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppGenerateImages.uploadIcon,
                                    height: 24.h,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Upload your profile picture',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(height: 22.h),
                      AuthTextFormFiled(
                        hintText: 'Username',
                        controller: nameController,
                      ),
                      SizedBox(height: 12.h),
                      AuthTextFormFiled(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      SizedBox(height: 12.h),
                      AuthTextFormFiled(
                        hintText: 'Password',
                        controller: passwordController,
                      ),
                      SizedBox(height: 12.h),
                      AuthTextFormFiled(
                        hintText: 'Confirm password',
                        controller: confirmController,
                      ),
                      SizedBox(height: 36.h),
                      InkWell(
                        onTap: isLoading
                            ? null
                            : () async {
                                if (nameController.text.isNotEmpty &&
                                    emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  if (passwordController.text ==
                                      confirmController.text) {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    try {
                                      final user = await FBAuthService().signUp(
                                        name: nameController.text,
                                        login: emailController.text,
                                        psw: passwordController.text,
                                        avatar: avatar,
                                      );
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const NavigPage(),
                                        ),
                                        (protected) => false,
                                      );
                                      asfasfasfafs.setString(
                                          'email', user.email);
                                      asfasfasfafs.setString('name', user.name);
                                      asfasfasfafs.setString('uid', user.uid);
                                      if (user.avatar != null) {
                                        asfasfasfafs.setString(
                                            'avatar', user.avatar!);
                                      }

                                      setState(() {
                                        isLoading = false;
                                      });
                                    } catch (e) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      print(e.toString());
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            removeBracketText(e.toString()),
                                          ),
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Password mismatch',
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(78),
                            color: Colors.white,
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator.adaptive()
                              : const Text(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Inter',
                                    color: Color(0xff00C8FF),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 24,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
