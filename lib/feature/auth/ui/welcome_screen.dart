import 'package:flutter/material.dart';
import 'package:hantaton_app/app/ui/components/app_text_button.dart';
import 'package:hantaton_app/feature/auth/ui/page_1.dart';
import 'package:hantaton_app/feature/auth/ui/page_2.dart';
import 'package:hantaton_app/feature/auth/ui/page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hantaton_app/app/di/init_di.dart';

import '../domain/auth_state/auth_cubit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  PageController pageController = PageController();
  bool flagFinishWelcomeScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: ConstColor.BACKGROUND_COLOR,
        body: Stack(
      children: [
        Container(
          alignment: const Alignment(0, -0.9),
          child: Text("test",),
        ),
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              flagFinishWelcomeScreen = (index == 2);
            });
          },
          children: const [
            Page1(),
            Page2(),
            Page3(),
          ],
        ),
        // Панель Навигации снизу
        Container(
          alignment: Alignment(0, 0.75),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: WormEffect(
                  activeDotColor: Theme.of(context).primaryColor,
                  type: WormType.thin,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              AppTextButton(
                  onPressed: () {
                    locator.get<AuthCubit>().finishWelcomeScreen();
                  },
                  text: pageController.page==3?'Начать':'Пропустить',),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        )
      ],
    ));
  }
}
