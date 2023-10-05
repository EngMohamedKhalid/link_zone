import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:link_zone/features/categories_feature/data/data_sources/categories_remote_data_source.dart';
import 'package:link_zone/features/categories_feature/data/repo_impl/categories_repo_impl.dart';
import 'package:link_zone/features/categories_feature/domain/repo/categories_repo.dart';
import 'package:link_zone/features/categories_feature/domain/use_cases/get_all_categories_use_case.dart';
import 'package:link_zone/features/home_feature/data/data_source/home_remote_data_source.dart';
import 'package:link_zone/features/home_feature/data/repo_impl/home_repo_impl.dart';
import 'package:link_zone/features/home_feature/domain/use_cases/get_home_use_case.dart';
import 'package:link_zone/features/profile_feature/data/data_source/profile_remote_data_source.dart';
import 'package:link_zone/features/profile_feature/data/repo_impl/profile_repo_impl.dart';
import 'package:link_zone/features/profile_feature/domain/repo/profile_repo.dart';
import 'package:link_zone/features/profile_feature/domain/usecases/complaints_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth_feature/data/data_source/auth_remote_data_source.dart';
import '../../features/auth_feature/data/repo_impl/auth_repo_impl.dart';
import '../../features/auth_feature/domain/repo/auth_repo.dart';
import '../../features/auth_feature/domain/usecases/change_password_use_case.dart';
import '../../features/auth_feature/domain/usecases/get_profile_use_case.dart';
import '../../features/auth_feature/domain/usecases/log_out_use_case.dart';
import '../../features/auth_feature/domain/usecases/login_use_case.dart';
import '../../features/auth_feature/domain/usecases/register_use_case.dart';
import '../../features/auth_feature/domain/usecases/update_profile_use_case.dart';
import '../../features/categories_feature/domain/use_cases/get_category_products.dart';
import '../../features/categories_feature/domain/use_cases/get_product_details_use_case.dart';
import '../../features/home_feature/domain/repo/home_repo.dart';
import '../../features/profile_feature/domain/usecases/faqs_use_case.dart';
import '../network/network_info.dart';
import '../network/network_manager.dart';
import '../services/cache_service.dart';
import 'navigation_helper.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // data sources
   getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImp(networkManager: getIt()),);
   getIt.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(networkManager: getIt()),);
   getIt.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(networkManager: getIt()),);
   getIt.registerLazySingleton<CategoriesRemoteDataSource>(() => CategoriesRemoteDataSourceImpl(networkManager: getIt()),);

  //* Repository
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(authRemoteDataSource: getIt(), networkInfo: getIt()),);
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(homeRemoteDataSource: getIt(), networkInfo: getIt()),);
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(profileRemoteDataSource: getIt(), networkInfo: getIt()),);
  getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepoImpl(categoriesRemoteDataSource: getIt(), networkInfo: getIt()),);
  //* Use cases
  _authUseCases();
   _homeUseCase();
   _catUseCase();
   _profileUseCase();


  //! ----------- app -----------
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  getIt.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
  // getIt.registerLazySingleton<FirebaseNotificationService>(() => FirebaseNotificationService(),);
  // getIt.registerLazySingleton<FlutterLocalNotificationService>(() => FlutterLocalNotificationService(),);
  getIt.registerSingleton<NavHelper>(NavHelper());
  getIt.registerSingleton<CacheService>(CacheService());
}

void _authUseCases() {
  getIt.registerLazySingleton<LogInUseCase>(() => LogInUseCase(authRepo: getIt()));
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(authRepo: getIt()));
  getIt.registerLazySingleton<ChangePasswordUseCase>(() => ChangePasswordUseCase(authRepo: getIt()));
  getIt.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(authRepo: getIt()));
  getIt.registerLazySingleton<LogOutUseCase>(() => LogOutUseCase(authRepo: getIt()));
  getIt.registerLazySingleton<UpdateProfileUseCase>(() => UpdateProfileUseCase(authRepo: getIt()));
}
void _homeUseCase(){
  getIt.registerLazySingleton<GetHomeDataUseCase>(() => GetHomeDataUseCase(repository: getIt()));
}
void _catUseCase(){
  getIt.registerLazySingleton<GetAllCategoriesUseCase>(() => GetAllCategoriesUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetAllCategoryProductsUseCase>(() => GetAllCategoryProductsUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetProductDetailsUseCase>(() => GetProductDetailsUseCase(repository: getIt()));
}
void _profileUseCase(){
  getIt.registerLazySingleton<ComplaintsUseCase>(() => ComplaintsUseCase(profileRepo: getIt()));
  getIt.registerLazySingleton<FAQSUseCase>(() => FAQSUseCase(profileRepo: getIt()));
}
