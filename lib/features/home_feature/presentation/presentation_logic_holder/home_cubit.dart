import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/hanlders/error_state_handler.dart';
import '../../../../app/utils/navigation_helper.dart';
import '../../data/models/home_model.dart';
import '../../domain/use_cases/get_home_use_case.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);

  HomeModel ? homeModel ;

  void getHomeData()async {
    emit(HomeLoading());
    final res = await getIt<GetHomeDataUseCase>()(NoParams());
    res.fold(
            errorStateHandler,
            (r){
              homeModel = r;
              print(homeModel?.banners[0].image??"");
              print(homeModel?.homeProducts[0].name??"");
            },
    );
    emit(HomeInitial());
  }
}
