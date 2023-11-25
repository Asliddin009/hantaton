import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hantaton_app/app/ui/components/app_text_button.dart';
import 'package:hantaton_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:hantaton_app/feature/auth/ui/login_screen.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});
  int toBe = 0;
  int passed = 0;
  late var event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(builder: (context,state){
      final userEntity = state.whenOrNull(
        authorized: (userEntity) => userEntity,
      );
      /*if(userEntity==null||userEntity.email.isEmpty){
        return Scaffold(
          body: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text("Вы не авторизованы"),
            AppTextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            }, text: "Авторизоваться")
          ],),),
        );
      }*/
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
                        height: MediaQuery.of(context).size.height*0.503,
                        color: Colors.white,
                          child: SvgPicture.asset('assets/account.svg')
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 68,
                          backgroundImage: NetworkImage('https://i.stack.imgur.com/UHa1c.png'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
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
                    "Ситников Никита",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Люблю ходить в похды и активные виды спорта. Рад новым знакомствам.",
                  style: TextStyle(
                    fontSize: 16
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Мои Мероприятия",
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SvgPicture.asset('assets/no_event.svg'),
                        Container(
                          height: 100,
                          padding: EdgeInsets.only(top: 20),
                          margin: EdgeInsets.only(bottom: 100),
                          color: Colors.black26,
                          child: Text(
                            "У вас пока нет созданных мероприятий",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white
                            ),
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
      backgroundColor: Color.fromRGBO(255, 199, 38, 10000),
      );
    });
  }
}
