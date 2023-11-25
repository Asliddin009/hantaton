// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feature/auth/data/network_auth_repository.dart' as _i9;
import '../../feature/auth/domain/auth_repository.dart' as _i8;
import '../../feature/auth/domain/auth_state/auth_cubit.dart' as _i12;
import '../../feature/map/domain/bloc/map_cubit.dart' as _i5;
import '../../feature/posts/data/net_post_repo.dart' as _i11;
import '../../feature/posts/domain/post_repo.dart' as _i10;
import '../data/dio_app_api.dart' as _i7;
import '../data/main_app_config.dart' as _i4;
import '../domain/app_api.dart' as _i6;
import '../domain/app_config.dart' as _i3;

const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AppConfig>(
    _i4.ProdAppConfig(),
    registerFor: {_prod},
  );
  gh.singleton<_i3.AppConfig>(
    _i4.DevAppConfig(),
    registerFor: {_dev},
  );
  gh.singleton<_i3.AppConfig>(
    _i4.TestAppConfig(),
    registerFor: {_test},
  );
  gh.singleton<_i5.MapCubit>(_i5.MapCubit());
  gh.singleton<_i6.AppApi>(_i7.DioAppApi(get<_i3.AppConfig>()));
  gh.factory<_i8.AuthRepository>(
      () => _i9.NetworkAuthRepository(get<_i6.AppApi>()));
  gh.factory<_i10.PostRepo>(() => _i11.NetPostRepo(get<_i6.AppApi>()));
  gh.singleton<_i12.AuthCubit>(_i12.AuthCubit(get<_i8.AuthRepository>()));
  return get;
}
