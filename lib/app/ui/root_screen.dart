import 'package:hantaton_app/app/ui/app_loader.dart';
import 'package:hantaton_app/feature/auth/ui/components/auth_builder.dart';
import 'package:hantaton_app/feature/auth/ui/welcome_screen.dart';
import 'package:hantaton_app/feature/main/ui/main_screen.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      isNotAuthorized: (context) =>const WelcomeScreen(),
      isWaiting: (context) => const AppLoader(),
      isAuthorized: (context, value, child) => const MainScreen(),
    );
  }
}
