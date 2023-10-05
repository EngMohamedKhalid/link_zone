part of 'carousel_cubit.dart';

abstract class CarouselState extends Equatable {
  const CarouselState();
}

class CarouselInitial extends CarouselState {
  final int index;
  const CarouselInitial(this.index);
  @override
  List<Object> get props => [index];
}
