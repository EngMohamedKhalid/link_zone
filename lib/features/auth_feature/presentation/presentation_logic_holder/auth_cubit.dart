
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/usecase/usecase.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/hanlders/error_state_handler.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/utils/navigation_helper.dart';
import '../../../../app/widgets/custom_alert_dialog.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import '../../../home_feature/presentation/screens/home_screen.dart';
import '../../data/model/user_model.dart';
import '../../domain/usecases/change_password_use_case.dart';
import '../../domain/usecases/get_profile_use_case.dart';
import '../../domain/usecases/log_out_use_case.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/register_use_case.dart';
import '../../domain/usecases/update_profile_use_case.dart';
import '../screens/auth_screen.dart';
import '../screens/new_pass_screen.dart';
import '../screens/otp_screen.dart';

part 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);
  //sign in
  final loginPasswordController = TextEditingController();
  final loginEmailController = TextEditingController();
  UserModel ? userModel;
  UserModel ? getProfileModel;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String ? jobType;
  String ? accountType;
  String ? name;
  //sign up
  final signUpFullNameController = TextEditingController();
  final signUpPhoneController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final githubLink = TextEditingController();
  final interested = TextEditingController();
  final skills = TextEditingController();
  final job = TextEditingController();
  //Change Password
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  //Update Profile

  final updateProfileNameController = TextEditingController();
  final updateProfilePhoneController = TextEditingController();
  final updateProfilePasswordController = TextEditingController();
  final updateProfileEmailController = TextEditingController();

  bool passObscure = true;

  void changeVisible(){
    passObscure = !passObscure;
    emit(AuthVisiblePasswordState(passObscure));
  }


  void login()async{
     emit(LoadingState());
     auth.signInWithEmailAndPassword(
         email:loginEmailController.text ,
         password: loginPasswordController.text,
     ).then((value){
       showToast(msg: "You logged as ${value.user?.email}",
           backgroundColor: AppColors.mainColor, textColor: Colors.white).then((value){
         navigateTo(const BNBScreen(),removeAll: true);
       });
     });
     emit(AuthInitial());
  }


  void register()async{
    emit(LoadingState());
    await auth.createUserWithEmailAndPassword(
      email:signUpEmailController.text ,
      password: signUpPasswordController.text,
    ).then((value){
      showToast(msg: "You logged as ${value.user?.email}",
          backgroundColor: AppColors.mainColor, textColor: Colors.white).then((value)async{
        navigateTo(const BNBScreen(),removeAll: true);
        await firebaseFirestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set(
            {
              "name":signUpFullNameController.text,
              "password":signUpPasswordController.text,
              "email":signUpEmailController.text,
              "phone":signUpPhoneController.text,
              "image":null,
              "id":FirebaseAuth.instance.currentUser!.uid,
              "github":githubLink.text,
              "interested":interested.text,
              "skills":skills.text,
              "currentJob":job.text,
              "workType":jobType,
              "accountType":accountType,
              'creationTime': DateFormat("dd/MM/yyyy").format(DateTime.now()),
            });
      });
    });
    emit(AuthInitial());
  }
  
  void logout() async{
    emit(LoadingState());
    await auth.signOut();
    emit(AuthInitial());
  }

  void getProfile() async{
    emit(LoadingState());
    final res = await getIt<GetProfileUseCase>()(NoParams());
    res.fold(
           errorStateHandler,
            (r){
          getProfileModel = r;
        }
    );
    emit(AuthInitial());
  }

  void changePassword() async{
    emit(LoadingState());
    final res = await getIt<ChangePasswordUseCase>()(
      ChangePasswordUseCaseParams(
          currentPassword: currentPasswordController.text,
          newPassword: newPasswordController.text,
      )
    );
    res.fold(
        errorStateHandler,
            (r){
          print(r.toString());
          showToast(msg: r.toString(),);

          navigateTo(AuthScreen());
        }
    );
    emit(AuthInitial());
  }

  void updateProfile() async{
    emit(LoadingState());
    final res = await getIt<UpdateProfileUseCase>()(
      UpdateProfileUseCaseParams(
          name: updateProfileNameController.text,
          phone: updateProfilePhoneController.text,
          email: updateProfileEmailController.text,
          password: updateProfilePasswordController.text,
          image: "image",
      )
    );
    res.fold(
        errorStateHandler,
            (r){
          userModel = r;
        }
    );
    emit(AuthInitial());
  }
}


