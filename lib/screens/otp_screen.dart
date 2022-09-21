import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapptask/constants/color_constants.dart';
import 'package:flutterapptask/constants/string_constants.dart';
import 'package:flutterapptask/providers/login_provider.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
        builder: (context, LoginProvider loginprovider, _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //  backgroundColor: ColorConstraints.bg_splashscreen,
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 10, bottom: 0, right: 0, top: 50),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          Stringconstraints.hint_login_enterpassword,
                          style: TextStyle(
                            height: 5,
                            fontSize: 20,
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color:
                              Color.fromRGBO(158, 158, 158, 1).withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5)
                    ]),
                child: Center(
                    child: Column(
                  children: [
                    TextFormField(
                      maxLength: 6,
                      autofocus: true,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          hintText: Stringconstraints.hint_login_enterpassword,
                          counterText: '',
                          border: InputBorder.none),
                      controller: loginprovider.loginotp,
                    ),
                  ],
                )),
              ),
              Expanded(child: Container()),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              loginprovider.LoginOTPVerify(context);
                            },
                            child: const Text(Stringconstraints.loginbtn),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor:
                                  ColorConstraints.welcomeCarouselCurrentSlide,
                              elevation: 5,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              disabledBackgroundColor:
                                  ColorConstraints.welcomeCarouselCurrentSlide,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
