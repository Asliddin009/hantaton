import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hantaton_app/app/ui/components/app_text_button.dart';
import 'package:hantaton_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:hantaton_app/feature/auth/ui/login_screen.dart';

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
        body: Container(
          margin: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Аслиддин",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: SvgPicture.asset(
                        'assets/page1.svg'
                      ),
                    ),
                  ]
              ),
              Text(
                "Я крутой программист, я программирую на всем, очень хочу научить всех зарабатывать деньги",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              SizedBox(height: 10,),
              TextButton.icon(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width)
                ),
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  label: Text("Избранное"),
              ),
              SizedBox(height: 10,),
              TextButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width)
                ),
                  onPressed: () {},
                  icon: Icon(Icons.mood),
                  label: Text("Категории"),
              ),
              SizedBox(height: 10,),
              Text(
                  "Организованные события",
                style: TextStyle(
                  fontSize: 22
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Предстоит - $toBe событие"
                  ),
                  Text(
                    "Прошло - $passed событие"
                  )
                ],
              ),
              SizedBox(height: 15,),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: 5,//event.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.width * 0.3,
                                  width: MediaQuery.of(context).size.width * 0.3,
                                    child: SvgPicture.asset(
                                        'assets/page2.svg'
                                    )
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Крутое событие",
                                      style: TextStyle(
                                        fontSize: 18
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      "Пользователь",
                                      style: TextStyle(
                                        fontSize: 14
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Icon(Icons.timelapse),
                                        Text(
                                          "13.00 - 16.00"
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Icon(Icons.date_range),
                                        Text("1 январяы"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_outlined),
                                        Text("Тц. небо")
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "Супер крутое событие, не забудьте взять хорошее настроеие", textAlign: TextAlign.left,
                               style: TextStyle(
                                 fontSize: 16,
                               ),
                            ),
                          ],
                        ),
                      );
                    }
                ),
              ),
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

                    },
                    child: const Text("Пропустить")),
              ),
            ],
          ),
        ),
      );
    });
  }
}
