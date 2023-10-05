import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'carousel_cubit/carousel_cubit.dart';

class CarouselWidget extends StatefulWidget {
  final List<Widget> items;
  const CarouselWidget({required this.items,Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: widget.items,
            options: CarouselOptions(
              height: 190.h,
              aspectRatio: 16/9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index,reason){
                CarouselCubit.get(context).changeIndex(index);
              },
              scrollDirection: Axis.horizontal,
            )
        ),
        // const SizedBox(height: 8,),
        // BlocBuilder<CarouselCubit, CarouselState>(
        //   builder: (context, state) {
        //     return state is CarouselInitial?Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: List<Widget>.generate(
        //             widget.items.length,
        //                 (index) => Padding(
        //               padding: const EdgeInsets.all(3),
        //               child: index==state.index
        //                   ?
        //               Container(
        //                 width: 36.w,
        //                 height: 12.h,
        //                 decoration: BoxDecoration(
        //                   color: AppColors.white,
        //                   borderRadius: BorderRadius.circular(10.r),
        //                 ),
        //               )
        //                   :
        //               CircleAvatar(
        //                 radius: 6.r,
        //                 backgroundColor: index==state.index?AppColors.white:AppColors.black262626,
        //               ),
        //             ),
        //           ),
        //         ):SizedBox();
        //   },
        // ),
      ],
    );
  }
}
