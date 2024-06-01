import 'package:flutter/material.dart';
import 'package:gemini/core/utils/app_images.dart';
import 'package:gemini/features/onboarding/views/widgets/navigation_timer.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    navigationTimer(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: AspectRatio(
                  aspectRatio: 9 / 2,
                  child: Image.asset(
                    Assets.appLogo,
                  ))),
          const Spacer(),
          Row(
            children: [
              const Spacer(
                flex: 2,
              ),
              const Text(
                "Developed By",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              RichText(
                  text: const TextSpan(
                text: 'Omar',
                style: TextStyle(
                  color: Color(0xFF777ED7),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: " Ashraf",
                    style: TextStyle(
                      color: Color(0xFFCB6674),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              )),
              const SizedBox(
                width: 3,
              ),
              Flexible(
                child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.08,
                    child: Image.asset(Assets.mobileFireLogo)),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
