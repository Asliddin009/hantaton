import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hantaton_app/app/ui/components/app_text_button.dart';
import 'package:hantaton_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:hantaton_app/feature/auth/ui/login_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(builder: (context,state){
      final userEntity = state.whenOrNull(
        authorized: (userEntity) => userEntity,
      );
      if(userEntity==null||userEntity.email.isEmpty){
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
      }
      return const Scaffold(

      );
    });
  }
}
