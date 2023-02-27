import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/main.dart';
import 'package:horpao_point/routes.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 2500),
      () => router.navigateTo(
        context,
        AppRoutes.home,
        replace: true,
        transition: TransitionType.cupertino,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              top: -150,
              right: -150,
              child: CircleAvatar(
                radius: 150,
                backgroundColor: AppColorSets.backgroundWhiteColor,
              ),
            ),
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * .9,
                child: const CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("lib/assets/images/horpao.jpg"),
                ),
              ),
            ),
            const Positioned(
              bottom: -200,
              left: -200,
              child: CircleAvatar(
                radius: 200,
                backgroundColor: AppColorSets.backgroundWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
