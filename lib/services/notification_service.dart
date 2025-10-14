// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();
//   factory NotificationService() => _instance;
//   NotificationService._internal();
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   Future<void> init() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);
//
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }
//
//   Future<void> showNotificationFromFCM(RemoteMessage message) async {
//     final notification = message.notification;
//     final android = message.notification?.android;
//
//     if (notification != null && android != null) {
//       const androidDetails = AndroidNotificationDetails(
//         'default_channel_id',
//         'Default Channel',
//         channelDescription: 'Used for FCM messages',
//         importance: Importance.max,
//         priority: Priority.high,
//       );
//
//       const platformDetails = NotificationDetails(android: androidDetails);
//
//       await flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         platformDetails,
//       );
//     } else {
//       const iOSDetails = DarwinNotificationDetails();
//
//       const platformDetails = NotificationDetails(iOS: iOSDetails);
//
//       await flutterLocalNotificationsPlugin.show(notification.hashCode,
//           notification?.title, notification?.body, platformDetails);
//     }
//   }
// }
