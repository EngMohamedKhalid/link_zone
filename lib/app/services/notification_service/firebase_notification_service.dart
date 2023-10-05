// import 'dart:developer';
// import 'dart:io';
// import '../../../employee/presentation/PLoH/cubit/bottom_navigation_cubit/bottom_navigation_cubit.dart';
// import '../../../guest_manager/presentation/PLoH/cubit/bottom_navigation_cubit/bottom_navigation_cubit.dart';
// import '../../local_data_sources/cache_data_source.dart';
// import '../cache_service.dart';
// import '../../utils/get_it_injection.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/widgets.dart';
// import 'flutter_local_notification_service.dart';
//
// class FirebaseNotificationService {
//
//   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//   final flutterLocalNotificationService = getIt<FlutterLocalNotificationService>();
//
//   //To be notified whenever the token is updated
//   static void onTokenChanged() {
//     _messaging.onTokenRefresh.listen((fcmToken) async {
//       debugPrint("token has been refreshed: $fcmToken");
//       await getIt<CacheService>().updateToken(newFcmToken: fcmToken);
//     }).onError((err) {
//       // Error getting token.
//     });
//   }
//
//   // request permission must be done on ios and web
//   static Future<void> requestPermission() async {
//     final NotificationSettings settings = await _messaging.requestPermission(
//       announcement: true,
//     );
//     //Calling this method updates these options to allow customizing notification
//     // presentation behavior whilst the application is in the foreground.
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true, // Required to display a heads up notification
//       badge: true,
//       sound: true,
//     );
//     //settings.authorizationStatus
//     debugPrint('User granted permission: ${settings.authorizationStatus}');
//   }
//
//   void handleForegroundNotifications() async{
//     // when the app is foreground and on focus status
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       log('Got a message whilst in the foreground! Message data: ${message.toMap()}',name: "onMessage");
//       if (message.notification != null) {
//         flutterLocalNotificationService.showFirebaseNotification(message);
//         getIt<CacheDataSource>().getUserType() =="emp"?
//         EmployeeBottomNavigationCubit.get().onReceivedNewNotification():
//         GuestManagerBottomNavigationCubit.get().onReceivedNewNotification();
//         debugPrint('Message also contained a notification: ${message.notification?.title}');
//       }
//     });
//     // whe click on the message
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       log("onMessageOpenedApp ${message.notification}\n${message.toMap()}",name:"onMessageOpenedApp" );
//       getIt<CacheDataSource>().getUserType() =="emp"?
//       EmployeeBottomNavigationCubit.get().changeTabIndex(3):
//       GuestManagerBottomNavigationCubit.get().changeTabIndex(3);
//     });
//
//     final message = await FirebaseMessaging.instance.getInitialMessage();
//       log("getInitialMessage ${message?.notification}\n${message?.toMap()}",name:"getInitialMessage");
//       if(message!=null){
//         getIt<CacheDataSource>().getUserType() =="emp"?
//         EmployeeBottomNavigationCubit.get().changeTabIndex(3):
//         GuestManagerBottomNavigationCubit.get().changeTabIndex(3);
//       }
//   }
//
//   void handleBackgroundNotifications() {
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   }
//
//   static void checkTokenChanging() async {
//     final String? currentFCMToken = getIt<CacheService>().getFcmToken();
//     final fcmToken = await FirebaseMessaging.instance.getToken();
//     if (fcmToken != null) {
//       if (currentFCMToken == null) {
//         await getIt<CacheService>().setFCMToken(fcmToken: fcmToken);
//       }
//       // if token changes then update token
//       else if (currentFCMToken != fcmToken) {
//         debugPrint("token has been changed $fcmToken");
//         await getIt<CacheService>().updateToken(newFcmToken: fcmToken);
//         // update on the server side
//       }
//     }
//   }
//
//   void setUp() async {
//     if (Platform.isIOS) await requestPermission();
//     handleBackgroundNotifications();
//     await flutterLocalNotificationService.setupFlutterNotifications();
//     handleForegroundNotifications();
//     checkTokenChanging();
//     onTokenChanged();
//   }
// }
//
// //When using Flutter version 3.3.0 or higher,
// // the message handler must be annotated with @pragma('vm:entry-point')
// // right above the function declaration (
// // otherwise it may be removed during tree shaking for release mode)
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   final flutterLocalNotificationService = getIt<FlutterLocalNotificationService>();
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//   await flutterLocalNotificationService.setupFlutterNotifications();
//   // flutterLocalNotificationService.showFirebaseNotification(message);
//   debugPrint("Handling a background message: ${message.messageId}");
// }
