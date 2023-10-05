import 'package:flutter/services.dart';

class UIHelpers {
  static void init() {
    _initLoader();
  }

  static void _initLoader() {
    // EasyLoading.instance
    //   ..loadingStyle = EasyLoadingStyle.custom
    //   ..backgroundColor = Colors.transparent
    //   ..indicatorSize = 45.0
    //   ..radius = 20.0
    //   ..maskType = EasyLoadingMaskType.custom
    //   ..progressColor = Colors.yellow
    //   ..indicatorColor = Colors.yellow
    //   ..textColor = Colors.yellow
    //   ..boxShadow = <BoxShadow>[]
    //   ..maskColor = Colors.white.withOpacity(0.75)
    //   ..userInteractions = false
    //   ..dismissOnTap = false;
  }

  // static void showLoading() {
  //   if (!EasyLoading.isShow) {
  //     EasyLoading.show(
  //       // status: 'Loading'.tr(),
  //       indicator: const LoadingAnimation(),
  //       maskType: EasyLoadingMaskType.none,
  //     );
  //   }
  // }

  // static void stopLoading() {
  //   if (EasyLoading.isShow) {
  //     EasyLoading.dismiss();
  //   }
  // }

  static void removeKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  // static Future<OverlaySupportEntry> showMessage(String message,
  //     [bool success = false]) async {
  //   return showSimpleNotification(
  //       Text(
  //         message,
  //         style: AppTextStyles.headLine20.copyWith(color: Colors.white),
  //       ),
  //       contentPadding: const EdgeInsets.all(8),
  //       elevation: 3,
  //       background: success
  //           ? ColorManager.primary.withOpacity(.8)
  //           : Colors.red.withOpacity(.8));
  // }

  // static OverlaySupportEntry overlayToUpdateApp(AppUpdaterModel appUpdaterModel) {
  //   return showOverlay((context, t) {
  //     return Opacity(
  //       opacity: t,
  //       child: Container(
  //         color: const Color(0xff000000),
  //         child: UpdateDialog(
  //           appUpdaterModel: appUpdaterModel,
  //         ),
  //       ),
  //     );
  //   }, duration: Duration.zero,);
  // }

  // static Future showCupDialog(Widget Function(BuildContext) builder) {
  //   return showDialog(
  //       context: getIt<NavService>().navigatorKey.currentContext!,
  //       builder: builder);
  // }

  // static Future showInformationMessage(String message) async {
  // UIHelpers.showCupDialog(
  //   (p0) {
  //     return Center(
  //       child: Container(
  //         width: 250,
  //         height: 150,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(message),
  //             const SizedBox(
  //               height: 16,
  //             ),
  //             ElevatedButton(
  //               onPressed: () => getIt<NavService>().pop(),
  //               child: Text("ok".tr()),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   },
  // );
  // }
}
