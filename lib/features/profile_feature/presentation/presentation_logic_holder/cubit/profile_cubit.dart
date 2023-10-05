
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/services/cache_service.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../../../../app/utils/get_it_injection.dart';
import '../../../../../app/utils/hanlders/error_state_handler.dart';
import '../../../../../app/utils/helper.dart';
import '../../../../../app/utils/navigation_helper.dart';
import '../../../../../app/widgets/custom_alert_dialog.dart';
import '../../../../../app/widgets/flutter_toast.dart';
import '../../../data/models/faqs_model.dart';
import '../../../domain/usecases/complaints_use_case.dart';
import '../../../domain/usecases/faqs_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(AccountInitial());
  static ProfileCubit get(context) => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);
  bool passObscure = true;
  FAQSModel ? faqsModel;

  void changeVisible(){
    passObscure = !passObscure;
    emit(AccountVisiblePasswordState(passObscure));
  }


  void getFAQS()async{
    emit(ContactUsLoading());
    final res = await getIt<FAQSUseCase>()(NoParams());
    res.fold(
      errorStateHandler,
            (r) {
              faqsModel =r;
              print(faqsModel?.data[0].question);
              print(faqsModel?.data[0].answer);
              print(faqsModel?.data[0].id);
            },
    );
    emit(AccountInitial());
  }
  void sendCom(ComplaintsUseCaseParams params)async{
    emit(ContactUsLoading());
    final res = await getIt<ComplaintsUseCase>()(
     params
    );
    res.fold(
      errorStateHandler,
          (r) {
        showToast(msg: r.toString());
      },
    );
    emit(AccountInitial());
  }
}
