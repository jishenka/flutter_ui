import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/ui/components/animated_btn.dart';
import 'package:flutter_ui/ui/components/custom_sign_in_dialog.dart';
import 'package:rive/rive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnController;
  bool showSignInDialog = false;

  @override
  void initState() {
    _btnController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width * 1.7,
          bottom: 200,
          left: 100,
          child: Image.asset("assets/Backgrounds/Spline.png"),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 10,
            ),
            child: const SizedBox(),
          ),
        ),
        const RiveAnimation.asset("assets/RiveAssets/new_shapes.riv"),
        Positioned(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const SizedBox(),
          ),
        ),
        AnimatedPositioned(
          top: showSignInDialog ? -50 : 0,
          duration: const Duration(milliseconds: 300),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: const [
                        Text(
                          "Learn Flutter UI",
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: "Poppins",
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Donec fringilla tortor non ipsum eleifend finibus. Sed lacinia dignissim ante sagittis ullamcorper. In turpis mauris, condimentum sed nisl vel, aliquam eleifend urna.",
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  AnimatedBtn(
                    btnController: _btnController,
                    onTap: () {
                      _btnController.isActive = true;
                      Future.delayed(const Duration(milliseconds: 1), () {
                        setState(() {
                          showSignInDialog = true;
                        });

                        customSigninDialog(context, onClosed: (value) {
                          setState(() {
                            showSignInDialog = false;
                          });
                        });
                      });
                    },
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
        // Image.asset("assets/Backgrounds/Spline.png"),
        // const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
      ],
    ));
  }
}
