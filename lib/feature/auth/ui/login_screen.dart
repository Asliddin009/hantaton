import 'package:flutter_svg/flutter_svg.dart';
import 'package:hantaton_app/app/di/init_di.dart';
import 'package:hantaton_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:hantaton_app/feature/auth/ui/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hantaton_app/feature/auth/ui/user_screen.dart';

import '../../../app/ui/components/app_text_button.dart';
import '../../../app/ui/components/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/authorization.svg'),
                    const Text(
                        "Логин",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(1, 25, 71, 0.60)
                      ),
                    ),
                    AppTextField(controller: controllerLogin, labelText: "логин"),
                    const SizedBox(height: 16),
                    const Text(
                      "Пароль",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(1, 25, 71, 0.60)
                      ),
                    ),
                    AppTextField(
                      obscureText: true,
                      controller: controllerPassword,
                      labelText: "пароль",
                    ),
                    const Text(
                      "Забыли пароль?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(1, 25, 71, 0.60)
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton.icon(
                        icon: const Text("Войти"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: const Color.fromRGBO(69,90,100, 1),
                          foregroundColor: Colors.white,
                        ),
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              _onTapToSignIn(context.read<AuthCubit>());
                            }
                          },
                          label: const Icon(Icons.arrow_forward),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Color.fromRGBO(69,90,100, 1),
                borderRadius: BorderRadius.only(topRight:  Radius.circular(40))
            ),
            width: double.infinity,
            child: Column(
              children: [
                Text(
                    "Вы новый пользователь? \n Скорее регистрируйтесь",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                    },
                    child: Text(
                      "РЕГИСТРАЦИЯ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(255,205,61, 1)
                      ),
                    )
                )
              ],
            ),
          )
        ],
      )
    );
  }

  void _onTapToSignIn(AuthCubit authCubit) => authCubit.signIn(
        username: controllerLogin.text,
        password: controllerPassword.text,
      );
}

