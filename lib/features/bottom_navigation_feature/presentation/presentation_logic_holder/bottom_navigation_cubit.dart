
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_zone/features/ai_assistant/presentation/screens/ai_chat_screen.dart';
import 'package:link_zone/features/profile_feature/presentation/screens/profile_screen.dart';


import '../../../categories_feature/presentation/screens/categories_screen.dart';
import '../../../home_feature/presentation/screens/home_screen.dart';
import '../../../projects_feature/presentation/screens/Projects_screen.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationStats> {
  BottomNavigationCubit() : super(BottomNavigationInitial());
  static BottomNavigationCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens =const  [
    HomeScreen(),
    CategoriesScreen(),
    ProjectsScreen(),
    AIChatScreen(),
    ProfileScreen(),
  ];
  void changeCurrent(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavigationIndex());
  }
}
