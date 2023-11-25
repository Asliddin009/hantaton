import 'dart:math';

import 'package:hantaton_app/app/di/init_di.dart';
import 'package:hantaton_app/app/domain/app_builder.dart';
import 'package:hantaton_app/app/ui/root_screen.dart';
import 'package:hantaton_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:hantaton_app/feature/posts/domain/post_repo.dart';
import 'package:hantaton_app/feature/posts/domain/state/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/map/domain/bloc/map_cubit.dart';

class MainAppBuilder implements AppBuilder {
  static const maxPossibleTsf = 1.1;

  @override
  Widget buildApp() {
    return _GlobalProviders(
      child: MaterialApp(
          builder: (context, child) {
            final data = MediaQuery.of(context);
            final newTextScaleFactor = min(maxPossibleTsf, data.textScaleFactor);
            // можно так, если нам надо задать минимальное и
            // максимальное значение:
            // data.textScaleFactor.clamp(minPossibleTsf, maxPossibleTsf);
            return MediaQuery(
              data: data.copyWith(
                textScaleFactor: newTextScaleFactor,
              ),
              child: child ?? const SizedBox.shrink(),
            );
          },

          debugShowCheckedModeBanner: false, home: RootScreen()),
    );
  }
}

class _GlobalProviders extends StatelessWidget {
  const _GlobalProviders({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => locator.get<AuthCubit>(),
      ),
      BlocProvider(
        create: (context) => locator.get<MapCubit>(),
      ),
      BlocProvider(
          create: (context) =>
              PostBloc(locator.get<PostRepo>(), locator.get<AuthCubit>())
                ..add(PostEvent.fetch()))
    ], child: child);
  }
}
