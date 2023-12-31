import 'package:hantaton_app/app/ui/app_loader.dart';
import 'package:hantaton_app/feature/home/ui/card_event.dart';
import 'package:hantaton_app/feature/auth/ui/components/auth_builder.dart';
import 'package:hantaton_app/feature/home/ui/create_event.dart';
import 'package:hantaton_app/feature/auth/ui/welcome_screen.dart';
import 'package:hantaton_app/feature/main/ui/main_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/home/ui/like_category.dart';
import '../../feature/auth/ui/login_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      isNotAuthorized: (context) => const WelcomeScreen(),
      isWaiting: (context) => const AppLoader(),
      isAuthorized: (context, value, child) =>  MainScreen(),
    );
  }
}
