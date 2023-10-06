import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_zone/features/categories_feature/presentation/presentation_logic_holder/categories_cubit.dart';
import 'package:link_zone/features/home_feature/presentation/presentation_logic_holder/home_cubit.dart';
import 'package:link_zone/features/notifications_feature/presentation/presentation_logic_holder/cubit/notification_cubit.dart';
import 'package:link_zone/features/profile_feature/presentation/presentation_logic_holder/cubit/profile_cubit.dart';
import 'package:overlay_support/overlay_support.dart';
import 'app/services/cache_service.dart';
import 'app/themes/get_theme.dart';
import 'app/utils/bloc_observer.dart';
import 'app/utils/get_it_injection.dart';
import 'app/utils/language_manager.dart';
import 'app/utils/navigation_helper.dart';
import 'app/widgets/carousel_widget/carousel_cubit/carousel_cubit.dart';
import 'features/auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';
import 'features/onboarding_feature/presentation/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await init();
  runApp(  MultiBlocProvider(
    providers: [
      BlocProvider<AuthCubit>(
        create: (BuildContext context) => AuthCubit(),
      ),
      BlocProvider<HomeCubit>(
        create: (BuildContext context) => HomeCubit()..getHomeData(),
      ),
      BlocProvider<CarouselCubit>(
        create: (BuildContext context) => CarouselCubit(),
      ),
      BlocProvider<CategoriesCubit>(
        create: (BuildContext context) => CategoriesCubit()..getAllCategories(),
      ),
      BlocProvider<ProfileCubit>(
        create: (BuildContext context) => ProfileCubit(),
      ),
      BlocProvider<NotificationCubit>(
        create: (BuildContext context) => NotificationCubit(),
      ),
    ],
    child:  MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        english_local,
        arabic_local,
      ],
      path: assets_path_localisations,
      fallbackLocale: english_local,
      saveLocale: true,
      startLocale:english_local ,
      child: OverlaySupport.global(
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'Link Zone',
              theme: linkZoneTheme(),
              debugShowCheckedModeBanner: false,
              navigatorKey: getIt<NavHelper>().navigatorKey,
              builder: EasyLoading.init(
                builder: (context, widget) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: widget!,
                  );
                },
              ),
              home: SplashScreen()
            // getIt<CacheService>().getUserToken() == null
            //     ?
            // const LoginScreen()
            //     :
            // getIt<CacheService>().getUserData()?.type=="company"
            //   ?
            // const BNBScreen()
            //     :
            // const UserCategoriesScreen(),
          ),
        ),
      ),
    );
  }
}
