import 'package:dazzling/features/cart/logic/cart_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  // ApiServices dependency
  getIt.registerSingleton<ApiServices>(ApiServices(dio: dio));
  // HomeRepo dependency
  getIt.registerSingleton<HomeRepo>(
    HomeRepo(apiServices: getIt<ApiServices>()),
  );
  // HomeCubit dependency
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(homeRepo: getIt<HomeRepo>()),
  );

    // CartCubit dependency
  getIt.registerLazySingleton<CartCubit>(
    () => CartCubit(),
  );
}
