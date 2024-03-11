import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slash_internship/core/network/network.dart';
import 'package:slash_internship/features/products/data/datasources/localdatasource.dart';
import 'package:slash_internship/features/products/data/datasources/remotedatasource.dart';
import 'package:slash_internship/features/products/data/repositories/repository_impl.dart';
import 'package:slash_internship/features/products/domain/repositories/repository.dart';
import 'package:slash_internship/features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:slash_internship/features/products/domain/usecases/get_product_details_usecase.dart';
import 'package:slash_internship/features/products/presentation/bloc/products/products_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc

  sl.registerFactory(() => ProductBloc(sl(),
      getAllProductsUsecase: sl(), getProductDetailsUsecase: sl()));

  //usecases
  sl.registerLazySingleton(() => GetAllProductsUsecase(sl()));
  sl.registerLazySingleton(() => GetProductDetailsUsecase(sl()));

  //repository

  sl.registerLazySingleton<ProductRepository>(() =>
      ProductRepositoryImplmentation(
          networkInfo: sl(), remoteDataSource: sl(), localDataSource: sl()));

  //datasources
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImplementation(client: sl()));
  sl.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImplementation(sharedPreferences: sl()));
  //core_connection
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //shared prefrences

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  //client of http
  sl.registerLazySingleton(() => http.Client);
  //internet connection checker
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
