import 'package:flutter/material.dart';
import 'package:hantaton_app/feature/auth/ui/page_1.dart';
import 'package:hantaton_app/feature/auth/ui/page_2.dart';
import 'package:hantaton_app/feature/auth/ui/page_3.dart';
import 'package:hantaton_app/feature/auth/ui/page_4.dart';
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

  List listTitle = ["Все мероприятия вашего города в одном месте!", "С нами планировать свой досуг проще!", "Создавайте свои собственные мероприятия!", "ппппппп!"];
  List listSubTitle = ["Расписание, анонсы и описание мероприятий структурированы и собраны воедино специально для вас.", "Личный кабинет и система уведомлений помогут вам сохранить понравившиеся мероприятия и не забыть про них позже.", "Организуйте мероприятия сами, собирайте друзей и находите новые компании по интересам.", "тоже какой-то текст."];
  String title = "";
  String subTitle = "";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    title = listTitle[0];
    subTitle = listSubTitle[0];
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
        body: Column(
      children: [
        Expanded(
          flex: 4,
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                flagFinishWelcomeScreen = (index == 3);
                title = listTitle[index];
                subTitle = listSubTitle[index];
              });
            },
            children: const [
              Page1(),
              Page2(),
              Page3(),
              Page4(),
            ],
          ),
        ),
        // Панель Навигации снизу
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: 4,
                effect: const WormEffect(
                  activeDotColor: Colors.black26,
                  type: WormType.thin,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                textAlign: TextAlign.center,
                title,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 35,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                    textAlign: TextAlign.center,
                    subTitle
                ),
              )
            ],
          ),
        ),
        !flagFinishWelcomeScreen ?
        Container(
          height: 60,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(bottom: 15),
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.black,
                  elevation: 1,
              ),
              onPressed: () {
                locator.get<AuthCubit>().finishWelcomeScreen();
              },
              child: const Text("Пропустить")),
        )
        :
        Container(
          height: 60,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(bottom: 15),
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  elevation: 1,
              ),
              onPressed: () {
                locator.get<AuthCubit>().finishWelcomeScreen();
              },
              child: const Text("Смотерть мероприятия")),
        ),
      ],
    ));
  }
}


