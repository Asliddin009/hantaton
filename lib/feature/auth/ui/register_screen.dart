import 'package:flutter_svg/svg.dart';
import 'package:hantaton_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hantaton_app/feature/home/ui/like_category.dart';
import 'package:hantaton_app/feature/auth/ui/login_screen.dart';

import '../../../app/ui/components/app_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final controllerLogin = TextEditingController();
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerDescription = TextEditingController();

  final controllerPassword = TextEditingController();
  final controllerPassword2 = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      Text("имя",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(1, 25, 71, 0.60)
                        ),),
                      AppTextField(controller: controllerFirstName, labelText: "Имя"),
                      const SizedBox(height: 16),
                      Text("фамилия",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(1, 25, 71, 0.60)
                        ),),
                      AppTextField(controller: controllerLastName, labelText: "Фамилия"),
                      const SizedBox(height: 16),
                      Text("логин",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(1, 25, 71, 0.60)
                        ),),
                      AppTextField(controller: controllerLogin, labelText: "логин"),
                      const SizedBox(height: 16),
                      Text("описание",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(1, 25, 71, 0.60)
                        ),),
                      AppTextField(controller: controllerDescription, labelText: "описание"),
                      const SizedBox(height: 16),
                      Text("пароль",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(1, 25, 71, 0.60)
                        ),),
                      AppTextField(
                        obscureText: true,
                        controller: controllerPassword,
                        labelText: "пароль",
                      ),
                      const SizedBox(height: 16),
                      Text("подтвердите пароль",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(1, 25, 71, 0.60)
                        ),),
                      AppTextField(
                        obscureText: true,
                        controller: controllerPassword2,
                        labelText: "подтвердите пароль",
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton.icon(
                          icon: const Text("Далее"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: const Color.fromRGBO(69,90,100, 1),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            if (formKey.currentState?.validate() != true) return;

                            if (controllerPassword2.text != controllerPassword.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Пароли не совпадают")));
                            } else {
                              _onTapToSignUp(context.read<AuthCubit>());
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LikeCategory()));
                            }
                          },
                          label: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(69,90,100, 1),
                  borderRadius: BorderRadius.only(topRight:  Radius.circular(40))
              ),
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    "Уже есть аккаунт?",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: const Text(
                        "Вход",
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
        ),
      ),
    );
  }

  void _onTapToSignUp(AuthCubit authCubit) => authCubit.signUp(
        username: controllerLogin.text,
        password: controllerPassword.text,
        email: controllerEmail.text, rePassword: controllerPassword2.text, description: controllerDescription.text, firstName: controllerFirstName.text,lastName: controllerLastName.text,

      );
}
