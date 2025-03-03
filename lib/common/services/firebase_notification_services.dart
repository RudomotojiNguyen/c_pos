// import 'dart:io';
// import 'dart:isolate';
// import 'dart:ui';

// import 'package:awesome_notifications/awesome_notifications.dart';
// // import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import '../constants/analytic_constants.dart';
// import '../constants/go_router.dart';
// import '../di/injection/injection.dart';
// import '../utils/analytics_utils.dart';

// ///  *********************************************
// ///     NOTIFICATION CONTROLLER
// ///  *********************************************
// ///
// class FirebaseNotificationServices extends ChangeNotifier {
//   /// *********************************************
//   ///   SINGLETON PATTERN
//   /// *********************************************
//   static final FirebaseNotificationServices _instance =
//       FirebaseNotificationServices._internal();

//   factory FirebaseNotificationServices() {
//     return _instance;
//   }

//   FirebaseNotificationServices._internal();

//   /// *********************************************
//   ///  OBSERVER PATTERN
//   /// *********************************************

//   final String channelKey = 'alerts';
//   final String channelName = 'Alerts';
//   final String channelDescription = 'Notification tests as alerts';

//   final String _firebaseToken = '';

//   String get firebaseToken => _firebaseToken;

//   final String _nativeToken = '';

//   String get nativeToken => _nativeToken;

//   ReceivedAction? initialAction;

//   final fcm = FirebaseMessaging.instance;

//   bool isFlutterLocalNotificationsInitialized = false;

//   int notificationId = -1;

//   /// *********************************************
//   ///   INITIALIZATION METHODS
//   /// *********************************************

//   static Future<void> initializeLocalNotifications(
//       {required bool debug}) async {
//     if (_instance.isFlutterLocalNotificationsInitialized) {
//       return;
//     }

//     await AwesomeNotifications().initialize(
//       null,
//       [
//         NotificationChannel(
//           channelKey: _instance.channelKey,
//           channelName: _instance.channelName,
//           channelDescription: _instance.channelDescription,
//           playSound: true,
//           importance: NotificationImportance.High,
//           defaultPrivacy: NotificationPrivacy.Private,
//           defaultColor: AppColors.primaryColor,
//           ledColor: AppColors.primaryColor,
//         )
//       ],
//       debug: debug,
//     );

//     // Get initial notification action is optional
//     _instance.initialAction = await AwesomeNotifications()
//         .getInitialNotificationAction(removeFromActionEvents: false);
//   }

//   static Future<void> initializeRemoteNotifications(
//       {required bool debug}) async {
//     /// Update the iOS foreground notification presentation options to allow
//     /// heads up notifications.
//     await _instance.fcm.setForegroundNotificationPresentationOptions(
//       alert: false,
//       badge: false,
//       sound: false,
//     );

//     _instance.fcm.onTokenRefresh.listen((fcmToken) {
//       // Note: This callback is fired at each app startup and whenever a new
//       if (getIt.isRegistered<AuthBloc>()) {
//         getIt<AuthBloc>().add(InitFirebaseTokenEvent(token: fcmToken));
//       }
//     }).onError((err) {
//       debugPrint('>>> onTokenRefresh error: ${err.toString()}');
//     });

//     // await AwesomeNotificationsFcm().initialize(
//     //     onFcmTokenHandle: FirebaseNotificationServices.myFcmTokenHandle,
//     //     onNativeTokenHandle: FirebaseNotificationServices.myNativeTokenHandle,
//     //     onFcmSilentDataHandle: FirebaseNotificationServices.mySilentDataHandle,
//     //     licenseKeys: null,
//     //     debug: debug,);
//     _instance.isFlutterLocalNotificationsInitialized = true;
//     // _instance.notifyListeners();
//   }

//   static ReceivePort? receivePort;

//   static Future<void> initializeIsolateReceivePort() async {
//     receivePort = ReceivePort('Notification action port in main isolate')
//       ..listen(
//           (silentData) => onActionReceivedImplementationMethod(silentData));

//     IsolateNameServer.registerPortWithName(
//         receivePort!.sendPort, 'notification_action_port');
//   }

//   ///  *********************************************
//   ///     LOCAL NOTIFICATION EVENTS
//   ///  *********************************************

//   static Future<void> getInitialNotificationAction() async {
//     ReceivedAction? receivedAction = await AwesomeNotifications()
//         .getInitialNotificationAction(removeFromActionEvents: true);
//     if (receivedAction == null) return;
//     debugPrint('App launched by a notification action: $receivedAction');
//   }

//   @pragma('vm:entry-point')
//   static Future<void> onActionReceivedMethod(
//       ReceivedAction receivedAction) async {
//     if (receivedAction.actionType == ActionType.SilentAction ||
//         receivedAction.actionType == ActionType.SilentBackgroundAction) {
//       // For background actions, you must hold the execution until the end
//       debugPrint(
//           'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
//       await executeLongTaskInBackground();
//       return;
//     } else {
//       if (receivePort == null) {
//         // onActionReceivedMethod was called inside a parallel dart isolate.
//         SendPort? sendPort =
//             IsolateNameServer.lookupPortByName('notification_action_port');

//         if (sendPort != null) {
//           // Redirecting the execution to main isolate process (this process is
//           // only necessary when you need to redirect the user to a new page or
//           // use a valid context)
//           sendPort.send(receivedAction);
//           return;
//         }
//       }
//     }

//     return onActionReceivedImplementationMethod(receivedAction);
//   }

//   static Future<void> onActionReceivedImplementationMethod(
//       ReceivedAction receivedAction) async {
//     debugPrint('>>> onActionReceivedImplementationMethod');

//     final FirebaseReceivedActionPayload payload =
//         FirebaseReceivedActionPayload.fromJson(receivedAction.payload ?? {});

//     if (payload.payload != null) {
//       handlePayloadNotification(notificationData: payload.payload!);
//     }
//   }

//   static handlePayloadNotification(
//       {BuildContext? ctx, required PayloadFirebaseModel notificationData}) {
//     BuildContext? context = ctx ?? DdvRouter().navigatorKey.currentContext;
//     if (context == null) {
//       return;
//     }

//     getIt.get<AnalyticsUtils>().sendAnalyticsEvent(
//       eventName: AnalyticConstant.openNotification,
//       trackingData: {
//         'title': 'click notification',
//         'platform': context.platform.name,
//         'link': notificationData.link ?? '',
//       },
//     );

//     if (notificationData.canOpenWebLink()) {
//       DdvRouter().push(
//         context,
//         routeName: RouteName.webView,
//         extra: WebArgumentsModel(
//           title: notificationData.title ?? '',
//           url: notificationData.url,
//         ),
//       );
//     } else {
//       DdvRouter().push(context, routeName: RouteName.notification);
//     }
//   }

//   static Future<bool> checkPermission() async {
//     try {
//       bool isAllowed = await AwesomeNotifications().isNotificationAllowed();

//       if (!isAllowed) {
//         return _instance.fcm.requestPermission().then(
//               (value) => value == AuthorizationStatus.authorized,
//             );
//       }
//       return true;
//     } catch (e) {
//       debugPrint('>>> settings error: $e');
//       return false;
//     }
//   }

//   static Future<void> startListeningNotificationEvents() async {
//     AwesomeNotifications()
//         .setListeners(onActionReceivedMethod: onActionReceivedMethod);
//   }

//   ///  *********************************************
//   ///     REMOTE NOTIFICATION EVENTS
//   ///  *********************************************

//   /// đăng ký nhận thông báo theo topic
//   static Future<void> subscribeToTopic({String topic = 'ddv_all'}) async {
//     await _instance.fcm.subscribeToTopic(topic);
//   }

//   /// hủy đăng ký nhận thông báo theo topic
//   static Future<void> unsubscribeFromTopic({String topic = 'ddv_all'}) async {
//     await _instance.fcm.unsubscribeFromTopic(topic);
//   }

//   /// Use this method to execute on background when a silent data arrives
//   /// (even while terminated)
//   // @pragma("vm:entry-point")
//   // static Future<void> mySilentDataHandle(FcmSilentData silentData) async {
//   //   debugPrint('"SilentData": ${silentData.toString()}');
//   //
//   //   if (silentData.createdLifeCycle != NotificationLifeCycle.Foreground) {
//   //     debugPrint("bg");
//   //   } else {
//   //     debugPrint("FOREGROUND");
//   //   }
//   //
//   //   debugPrint('mySilentDataHandle received a FcmSilentData execution');
//   //   await executeLongTaskInBackground();
//   // }

//   /// Use this method to detect when a new fcm token is received
//   // @pragma("vm:entry-point")
//   // static Future<void> myFcmTokenHandle(String token) async {
//   //   if (token.isNotEmpty) {
//   //     debugPrint('Firebase Token:"$token"');
//   //   } else {
//   //     debugPrint('Firebase Token deleted');
//   //   }
//   //
//   //   _instance._firebaseToken = token;
//   //   _instance.notifyListeners();
//   // }

//   /// Use this method to detect when a new native token is received
//   // @pragma("vm:entry-point")
//   // static Future<void> myNativeTokenHandle(String token) async {
//   //   debugPrint('Native Token:"$token"');
//   //
//   //   _instance._nativeToken = token;
//   //   _instance.notifyListeners();
//   // }

//   static Future<void> fcmListening() async {
//     /// khi mở app
//     _instance.fcm.getInitialMessage().then(
//       (value) {
//         final PayloadFirebaseModel? notificationData = value?.data == null
//             ? null
//             : PayloadFirebaseModel.fromJson(value!.data);

//         if (notificationData != null) {
//           handlePayloadNotification(notificationData: notificationData);
//         }
//       },
//     );

//     /// khi có thông báo tới
//     FirebaseMessaging.onMessage.listen((event) {
//       if (Platform.isIOS) return;

//       createNewNotification(event);
//     });

//     /// nhấn vào thông báo + đang mở app
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       final PayloadFirebaseModel notificationData =
//           PayloadFirebaseModel.fromJson(message.data);
//       handlePayloadNotification(notificationData: notificationData);
//     });
//   }

//   ///  *********************************************
//   ///     REQUEST NOTIFICATION PERMISSIONS
//   ///  *********************************************

//   static Future<void> executeLongTaskInBackground() async {
//     debugPrint("starting long task");
//     await Future.delayed(const Duration(seconds: 4));
//     // final url = Uri.parse("http://google.com");
//     // final re = await http.get(url);
//     // debugPrint(re.body);
//     debugPrint("long task done");
//   }

//   ///  *********************************************
//   ///     LOCAL NOTIFICATION CREATION METHODS
//   ///  *********************************************

//   static Future<void> createNewNotification(RemoteMessage message) async {
//     bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
//     if (!isAllowed) {
//       isAllowed = await checkPermission();
//       if (!isAllowed) return;
//     }

//     /// nội dung cơ bản theo từng loại thiết bị
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//     AppleNotification? apple = message.notification?.apple;
//     // final WebNotification? web = message.notification?.web;

//     /// nội dung bên trong
//     Map<String, String> payload =
//         message.data.map((key, value) => MapEntry(key, value.toString()));

//     final String? imageUrl = android?.imageUrl ?? apple?.imageUrl;

//     /// TODO:
//     /// check lại tại sao IOS vẫn hiện dialog khi ở foreground
//     /// nếu vẫn tiếp tục hiện thì check thêm ios -> break
//     if (notification != null && !kIsWeb) {
//       await AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: notification.hashCode,
//           channelKey: _instance.channelKey,
//           title: notification.title ?? '',
//           body: notification.body,
//           bigPicture: imageUrl,
//           // largeIcon: largeIcon,
//           notificationLayout: NotificationLayout.Default,
//           payload: payload,
//         ),
//       );
//     }
//   }

//   static Future<void> resetBadge() async {
//     await AwesomeNotifications().resetGlobalBadge();
//   }

//   static Future<void> deleteToken() async {
//     await _instance.fcm.deleteToken();
//     // await AwesomeNotificationsFcm().deleteToken();
//     // await Future.delayed(const Duration(seconds: 5));
//     // await requestFirebaseToken();
//   }

//   ///  *********************************************
//   ///     REMOTE TOKEN REQUESTS
//   ///  *********************************************

//   static Future<String> requestFirebaseToken() async {
//     try {
//       if (Firebase.apps.isNotEmpty) {
//         // if (await AwesomeNotificationsFcm().isFirebaseAvailable) return await AwesomeNotificationsFcm().requestFirebaseAppToken();
//         final token = await _instance.fcm.getToken();
//         debugPrint('>>> token device: $token');
//         return token ?? '';
//       } else {
//         debugPrint('Firebase is not available on this project');
//       }
//       return '';
//     } catch (e) {
//       debugPrint('>>> get token device error: $e');
//       return '';
//     }
//   }

//   @pragma('vm:entry-point')
//   static Future<void> firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     await Firebase.initializeApp();
//     await initializeLocalNotifications(debug: true);
//     await initializeRemoteNotifications(debug: true);
//     await createNewNotification(message);
//     // If you're going to use other Firebase services in the background, such as Firestore,
//     // make sure you call `initializeApp` before using other Firebase services.
//     print('Handling a background message ${message.messageId}');
//   }
// }
