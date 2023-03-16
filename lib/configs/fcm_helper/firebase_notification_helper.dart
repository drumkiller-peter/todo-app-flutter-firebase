import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/configs/routes/app_routes.dart';
import 'package:todo_app_flutter/configs/routes/navigator_service.dart';
import 'package:todo_app_flutter/constants/app_constants.dart';

class FirebaseNotificationHelper {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  StreamSubscription? subscription;

  Future<void> init() async {
    try {
      await _requestPermission();
      await _onTokenRefresh();
      await _initLocalNotifications();
      subscription =
          FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (message.notification != null) {
          showNotification(message);
        }
      });

      // Get any messages which caused the application to open from
      // a terminated state.
      RemoteMessage? initialMessage =
          await _firebaseMessaging.getInitialMessage();

      // If the message also contains a data property with a "type" of "chat",
      // navigate to a chat screen
      if (initialMessage != null) {
        _handleOnClickNotification(initialMessage.data);
      }
      //Returns info on if a notification created from this plugin had been used to launch the application.

      final localNotification =
          await _localNotifications.getNotificationAppLaunchDetails();
      if (localNotification?.didNotificationLaunchApp ?? false) {
        if (localNotification?.notificationResponse?.payload != null) {
          _handleOnClickNotification(
              jsonDecode(localNotification!.notificationResponse!.payload!));
        }
      }

      //if the app has opened from a background state (not terminated).
      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        return _handleOnClickNotification(event.data);
      });
    } catch (e) {
      log("Exception has occurred here:::::::::::::::::::::::::");
      log(e.toString());
    }
  }

  Future<void> _requestPermission() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> _onTokenRefresh() async {
    _firebaseMessaging.onTokenRefresh.listen((token) {
      registerToken(token);
    });
    final token = await _firebaseMessaging.getToken();
    log(token.toString());
    if (token != null) {
      registerToken(token);
    }
  }

  Future<void> registerToken(String token) async {
    // await getIt.get<NotificationRepository>().registerToken(token);
  }

  Future<void> _initLocalNotifications() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings iosInitializationSettings =
        const DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    _localNotifications.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) async {
      if (payload.payload != null) {
        _handleOnClickNotification(jsonDecode(payload.payload!));
      }
    });
  }

  void _handleOnClickNotification(Map<String, dynamic> notificationData) {
    getIt.get<NavigatorService>().navigator.pushNamed(AppRoutes.profile);
  }

  Future<void> showNotification(RemoteMessage message) async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      message.notification?.android?.channelId ??
          AppConstants.defaultAppChannelId,
      AppConstants.defaultAppChannelName,
      channelDescription: AppConstants.defaultAppChannelDescription,
      priority: Priority.high,
      importance: Importance.max,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await _localNotifications.show(
      // DateTime.now().millisecondsSinceEpoch ~/ 1000,
      0,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }

  Future<void> onClearToken() {
    return _firebaseMessaging.deleteToken();
  }

  Future<void> onClose() async {
    return subscription?.cancel();
  }
}
