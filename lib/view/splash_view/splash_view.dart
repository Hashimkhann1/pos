

import 'package:flutter/material.dart';
import 'package:pos/component/my_text.dart';
import 'package:pos/res/color/app_color.dart';
import 'package:pos/view_model/splash_view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {

    SplashViewModel().splashTime(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(title: "POS",fontSize: 60,fontWeight: FontWeight.w900,color: AppColor.white.withOpacity(0.9),),
            CircularProgressIndicator(color: AppColor.white.withOpacity(0.9),)
          ],
        ),
      ),
    );
  }
}
