
import 'package:get_it/get_it.dart';
import 'package:instagram_clone_app/controller/auth/auth_cubit.dart';
import 'package:instagram_clone_app/controller/home/home_cubit.dart';
import 'package:instagram_clone_app/core/repository/auth.dart';
import 'package:instagram_clone_app/core/repository/home.dart';
import 'package:instagram_clone_app/core/web_services/auth.dart';
import 'package:instagram_clone_app/core/web_services/home.dart';

final sl=GetIt.instance;
Future<void> initGetIt() async {
  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerLazySingleton(() => AuthRepository(sl()));
  sl.registerLazySingleton(() => AuthWebService());

  sl.registerFactory(() => HomeCubit(sl()));
  sl.registerLazySingleton(() => HomeRepository(sl()));
  sl.registerLazySingleton(() => HomeWebService());

}
