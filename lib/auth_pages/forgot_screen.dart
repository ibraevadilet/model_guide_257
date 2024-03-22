import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:model_guide_257/components/auth_text_field.dart';
import 'package:model_guide_257/components/terms_widgets.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final emailController = TextEditingController();

  bool isLoading = false;
  String getPasswordFromJsonString(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap['password'];
  }

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
                        'Forgot password?',
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
                      ),
                      SizedBox(height: 36.h),
                      InkWell(
                        onTap: isLoading
                            ? null
                            : () async {
                                if (emailController.text.isNotEmpty) {
                                  CollectionReference firestore =
                                      FirebaseFirestore.instance
                                          .collection('users');
                                  final users = await firestore.get();
                                  if (users.docs.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("This email doesn't exist"),
                                      ),
                                    );
                                  } else {
                                    for (var e in users.docs) {
                                      if (e
                                          .data()
                                          .toString()
                                          .contains(emailController.text)) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        String username = 'f96371442@gmail.com';
                                        String password = 'ggirfntjenhylpkc';
                                        String passwordForgot = e['password'];
                                        print(passwordForgot);

                                        final smtpServer =
                                            gmail(username, password);
                                        final message = Message()
                                          ..from = Address(
                                              username, 'Model Guide App')
                                          ..recipients.add(emailController.text)
                                          ..subject = 'Rest password'
                                          ..text =
                                              'Your password: $passwordForgot';

                                        try {
                                          await send(message, smtpServer);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  "Email sent successfully"),
                                            ),
                                          );
                                          setState(() {
                                            isLoading = false;
                                          });
                                        } catch (e) {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(e.toString()),
                                            ),
                                          );
                                        }
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "This email doesn't exist"),
                                          ),
                                        );
                                      }
                                      print(e.data().toString());
                                      print(emailController.text);
                                      print(e
                                          .data()
                                          .toString()
                                          .contains(emailController.text));
                                    }
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
                                  'Reset password',
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
