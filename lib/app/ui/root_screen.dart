import 'package:hantaton_app/app/ui/app_loader.dart';
import 'package:hantaton_app/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:hantaton_app/feature/auth/ui/components/auth_builder.dart';
import 'package:hantaton_app/feature/auth/ui/login_screen.dart';
import 'package:hantaton_app/feature/main/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hantaton_app/feature/map/ui/map_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      isNotAuthorized: (context) =>const MapScreen(),
      isWaiting: (context) => const AppLoader(),
      isAuthorized: (context, value, child) => MainScreen(userEntity: value),
    );
  }
}
