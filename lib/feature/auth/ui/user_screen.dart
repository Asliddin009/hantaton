import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hantaton_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:hantaton_app/feature/auth/ui/login_screen.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  int toBe = 0;
  int passed = 0;
  late var event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      final userEntity = state.whenOrNull(
        authorized: (userEntity) => userEntity,
      );
      if (userEntity?.id == 0) {
        return LoginScreen();
      } else {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.503,
                            color: Colors.white,
                            child: SvgPicture.asset('assets/account.svg')),
                        const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 68,
                          backgroundImage: NetworkImage(
                              'https://i.stack.imgur.com/UHa1c.png'),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text("Ханты-мансийск"),
                          Icon(Icons.date_range),
                          Text("25 ноября"),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "${userEntity?.first_name ?? " "} ${userEntity?.last_name ?? " "}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  child: Text(
                    userEntity?.description ??
                        "Люблю ходить в походы и активные виды спорта. Рад новым знакомствам.",
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0)),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Мои Мероприятия",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SvgPicture.asset('assets/no_event.svg'),
                          Container(
                            height: 100,
                            padding: const EdgeInsets.only(top: 20),
                            margin: const EdgeInsets.only(bottom: 100),
                            color: Colors.black26,
                            child: const Text(
                              "У вас пока нет созданных мероприятий",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: const Color.fromRGBO(255, 199, 38, 10000),
        );
      }
    });
  }
}
