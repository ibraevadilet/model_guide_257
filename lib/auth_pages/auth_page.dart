import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_guide_257/auth_pages/forgot_screen.dart';
import 'package:model_guide_257/auth_pages/register_screen.dart';
import 'package:model_guide_257/auth_pages/servieces/fb_auth_service.dart';
import 'package:model_guide_257/components/auth_text_field.dart';
import 'package:model_guide_257/components/terms_widgets.dart';
import 'package:model_guide_257/main.dart';
import 'package:model_guide_257/pages/navig_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00C8FF),
      bottomNavigationBar: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: TermsButtons(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 36.h),
                  AuthTextFormFiled(
                    hintText: 'Email',
                    controller: emailController,
                    onChanged: (val) {
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 12.h),
                  AuthTextFormFiled(
                    hintText: 'Password',
                    controller: passwordController,
                    onChanged: (val) {
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 36.h),
                  InkWell(
                    onTap: isLoading
                        ? null
                        : () async {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              setState(() {
                                isLoading = true;
                              });

                              try {
                                final user = await FBAuthService().signIn(
                                  emailController.text,
                                  passwordController.text,
                                );
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NavigPage(),
                                  ),
                                  (protected) => false,
                                );

                                asfasfasfafs.setString('email', user.email);
                                asfasfasfafs.setString('name', user.name);
                                asfasfasfafs.setString('uid', user.uid);
                                if (user.avatar != null) {
                                  asfasfasfafs.setString(
                                      'avatar', user.avatar!);
                                }
                                if (user.about != null) {
                                  asfasfasfafs.setString('about', user.about!);
                                }
                                if (user.images != null) {
                                  asfasfasfafs.setStringList(
                                      'images', user.images!);
                                }

                                setState(() {
                                  isLoading = false;
                                });
                              } catch (e) {
                                setState(() {
                                  isLoading = false;
                                });
                                print(e.toString());
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text(removeBracketText(e.toString())),
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
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                                color: Color(0xff00C8FF),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String removeBracketText(String input) {
  RegExp regExp = RegExp(r'\[.*?\]\s*');
  return input.replaceAll(regExp, '');
}
