import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Center(
        child: SvgPicture.asset(Assets.images.svg.karyaLogo),
      ),
    );
  }
}
