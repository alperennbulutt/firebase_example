import 'dart:async';

import 'package:firebase_notifications_handler/firebase_notifications_handler.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

late AndroidNotificationChannel channel = AndroidNotificationChannel(
    "qnbfinansbank_flutter_firebase_channel", "qnbfinansbankfirebase");

final StreamController<String?> selectedNotificationStream =
    StreamController<String?>.broadcast();

notificationTapBackground(NotificationResponse notificationResponse) {
  print('notification: ${notificationResponse.id}');
  print('payload: ${notificationResponse.payload} ');
}

const String navigationActionId = 'id_3';

class NotificationService {
  Future<void> init(
      BuildContext context, GlobalKey<NavigatorState> navigatorKey) async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

// ios and macos
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();
//init settings for app
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            selectedNotificationStream.add(notificationResponse.payload);
            break;

          case NotificationResponseType.selectedNotificationAction:
            if (notificationResponse.actionId == navigationActionId) {
              selectedNotificationStream.add(notificationResponse.payload);
            }
            break;
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    //

    channel = const AndroidNotificationChannel(
      'qnbfinansbank_flutter_firebase_channel',
      'qnbfinansbankfirebase',
      importance: Importance.defaultImportance,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    showLocalNotification(RemoteNotification? notification,
        Map<String, dynamic> payloadData) async {
      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification!.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              icon: 'app_icon', playSound: true, enableVibration: true),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: payloadData["route"],
      );
    }
  }
}
