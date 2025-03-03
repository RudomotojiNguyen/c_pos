// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationUtils {
//   factory NotificationUtils() => _singleTone;
//
//   NotificationUtils._internal();
//
//   static final _singleTone = NotificationUtils._internal();
//
//   late final FirebaseMessaging _messaging;
//   late AndroidNotificationChannel channel;
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//   // late final AnalyticsUtils analyticsUtils;
//
//   Future<void> init(BuildContext context) async {
//     await Firebase.initializeApp();
//     // analyticsUtils = getIt.get<AnalyticsUtils>();
//     _messaging = FirebaseMessaging.instance;
//     await _messaging.getInitialMessage().then((RemoteMessage? message) {
//       if (message != null) {
//         debugPrint('>>>>> Handle message ${message.toString()}');
//       }
//     });
//
//     // FirebaseMessaging.onMessage.listen((remoteMessage){
//     //   debugPrint('>>>>> onMessage');
//     //    _handleRemoteMessage(remoteMessage);
//     // });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       debugPrint('>>>>> #X. A new onMessageOpenedApp event was published!');
//       // analyticsUtils.sendAnalyticsEvent(
//       //   eventName: AnalyticConstant.openNotification,
//       //   trackingData: {
//       //     'title': message.notification?.title,
//       //     'platform': context.platform.name,
//       //   },
//       // );
//       // GoRouter.of(context).go('/${RouteName.notification}');
//     });
//
//     FirebaseMessaging.onBackgroundMessage((remoteMessage) {
//       debugPrint('>>>>> #1. onBackgroundMessage');
//       return _handleRemoteMessage(remoteMessage, context);
//     });
//     await _messaging
//         .getToken()
//         .then((value) => debugPrint('>>>>> Token: $value'));
//
//     final settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       provisional: false,
//       sound: true,
//     );
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       debugPrint('>>>>> User granted permission');
//
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         debugPrint('>>>>> #2. onMessage listen');
//
//         _handleRemoteMessage(message, context);
//
//         // analyticsUtils.sendAnalyticsEvent(
//         //   eventName: AnalyticConstant.receiveNotification,
//         //   trackingData: {
//         //     'title': message.notification?.title,
//         //     'platform': context.platform.name,
//         //   },
//         // );
//
//         // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         //   debugPrint('>>>>> A new onMessageOpenedApp event was published!');
//         //   GoRouter.of(context).go('/${RouteName.notification}');
//         // });
//       });
//     } else {
//       debugPrint('>>>>> User declined or has not accepted permission');
//     }
//
//     if (!kIsWeb) {
//       channel = const AndroidNotificationChannel(
//         'high_importance_channel',
//         'High Importance Notifications',
//         description: 'This channel is used for important notifications.',
//         importance: Importance.max,
//       );
//
//       flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//       /// Create an Android Notification Channel.
//       ///
//       /// We use this channel in the `AndroidManifest.xml` file to override the
//       /// default FCM channel to enable heads up notifications.
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);
//
//       const androidInitializationSettings =
//           AndroidInitializationSettings('@mipmap/ic_launcher');
//       final initializationSettingsIOS = DarwinInitializationSettings(
//           onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//
//       const initializationSettingsMacOS = DarwinInitializationSettings();
//
//       final initializationSettings = InitializationSettings(
//         android: androidInitializationSettings,
//         iOS: initializationSettingsIOS,
//         macOS: initializationSettingsMacOS,
//       );
//       await flutterLocalNotificationsPlugin.initialize(
//         initializationSettings,
//         onDidReceiveNotificationResponse:
//             (NotificationResponse notificationResponse) {
//           debugPrint('>>>>> ${notificationResponse.payload}');
//         },
//       );
//
//       /// Update the iOS foreground notification presentation options to allow
//       /// heads up notifications.
//       await FirebaseMessaging.instance
//           .setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     }
//   }
//
//   Future _handleRemoteMessage(
//       RemoteMessage message, BuildContext context) async {
//     final notification = message.notification;
//     final android = message.notification?.android;
//     if (notification != null && android != null && !kIsWeb) {
//       await flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         'X>>> ${notification.title}',
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(channel.id, channel.name,
//               channelDescription: channel.description ?? '',
//               icon: 'ic_notification',
//               importance: Importance.max,
//               color: const Color(0xFFE52E41)),
//         ),
//       );
//     }
//   }
//
//   Future<void> onDidReceiveLocalNotification(
//       int? id, String? title, String? body, String? payload) async {
//     debugPrint('>>>>> onDidReceiveLocalNotification');
//   }
// }
