import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'carousel_state.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit() : super(CarouselInitial(0));
  static CarouselCubit get(context) => BlocProvider.of(context);
  int currentIndex  = 0;

  changeIndex(int index){
    currentIndex == index ;
    emit(CarouselInitial(index));
  }
}
