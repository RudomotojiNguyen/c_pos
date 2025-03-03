// import 'package:firebase_analytics/firebase_analytics.dart';

// import '../constants/analytic_constants.dart';

// class AnalyticsUtils {
//   final FirebaseAnalytics analytics;

//   AnalyticsUtils({required this.analytics});

//   Future<void> sendAnalyticsEvent({
//     required String eventName,
//     Map<String, Object>? trackingData,
//   }) async {
//     if (Configurations.shared.isAnalyticAndCrashlytic) {
//       await analytics.logEvent(
//         name: eventName,
//         parameters: trackingData ?? {},
//       );
//     }
//   }

//   Future<void> trackingScreenEvent({
//     String? currentScreen,
//     String? lastScreen,
//   }) async {
//     if (Configurations.shared.isAnalyticAndCrashlytic) {
//       await analytics.setCurrentScreen(
//         screenName: currentScreen ?? '',
//         screenClassOverride: lastScreen ?? '',
//       );
//     }
//   }

//   Future<void> trackRestApiResponseError({
//     Map<String, Object>? trackingData,
//   }) async {
//     if (Configurations.shared.isAnalyticAndCrashlytic) {
//       await analytics.logEvent(
//         name: AnalyticConstant.restResponseError,
//         parameters: trackingData ?? {},
//       );
//     }
//   }

//   Future<void> loginEvent({required String phoneNumber}) async {
//     if (Configurations.shared.isAnalyticAndCrashlytic) {
//       await analytics.logLogin(loginMethod: phoneNumber);
//     }
//   }

//   Future<void> logOut() async {
//     if (Configurations.shared.isAnalyticAndCrashlytic) {
//       await analytics.logEvent(name: AnalyticConstant.signOutEvent);
//     }
//   }

//   Future<void> trackRequestOtpEvent({required String phoneNumber}) async {
//     if (Configurations.shared.isAnalyticAndCrashlytic) {
//       await analytics.logEvent(
//         name: AnalyticConstant.requestOtp,
//         parameters: {'phone': phoneNumber},
//       );
//     }
//   }

//   Future<void> trackVerifyOtpEvent({
//     required bool isSuccess,
//     String? errorMessage,
//   }) async {
//     if (Configurations.shared.isAnalyticAndCrashlytic) {
//       final String success = isSuccess ? 'true' : 'false';
//       await analytics.logEvent(
//         name: AnalyticConstant.verifyOtp,
//         parameters: {
//           'is_success': success,
//           'message': errorMessage ?? '',
//         },
//       );
//     }
//   }

//   Future<void> trackPickAvatarEvent({required String? path}) async {
//     if (Configurations.shared.isAnalyticAndCrashlytic) {
//       await analytics.logEvent(
//         name: AnalyticConstant.avatarPath,
//         parameters: <String, Object>{'path': path ?? ''},
//       );
//     }
//   }
// }
