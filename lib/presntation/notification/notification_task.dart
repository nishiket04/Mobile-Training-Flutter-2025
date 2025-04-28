import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class NotificationTask extends StatefulWidget {
  const NotificationTask({super.key});

  @override
  State<NotificationTask> createState() => _NotificationTaskState();
}

class _NotificationTaskState extends State<NotificationTask> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _initializeFirebaseAndNotification();
  }

  Future<void> _initializeFirebaseAndNotification() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print('Notification payload: ${response.payload}');
      },
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Foreground Message: ${message.notification?.title}');
      _showFirebaseNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification clicked!');
    });

    String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');
  }

  Future<void> _showFirebaseNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'firebase_channel_id',
        'firebase_channel_name',
        channelDescription: 'Channel for firebase push notifications',
        importance: Importance.max,
        priority: Priority.high,
      );

      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
      );

      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        platformChannelSpecifics,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showBigTextNotification,
              child: const Text('Big Text Notification'),
            ),
            ElevatedButton(
              onPressed: _showProgressNotification,
              child: const Text('Progress Notification'),
            ),
            ElevatedButton(
              onPressed: _showActionNotification,
              child: const Text('Action Notification'),
            ),
          ],
        ),
      ),
    );
  }

  // Big Text Notification
  Future<void> _showBigTextNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'training',
      'training_notification',
      channelDescription: 'Your channel description',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: BigTextStyleInformation(
        'This is a very big text that will be displayed when the notification is expanded.',
      ),
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Big Text Title',
      'Expand to read more...',
      platformChannelSpecifics,
      payload: 'big_text_payload',
    );
  }

  // Progress Notification
  Future<void> _showProgressNotification() async {
    for (int i = 0; i <= 100; i += 20) {
      await Future.delayed(const Duration(milliseconds: 500));

      final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'progress_channel_id',
        'progress_channel_name',
        channelDescription: 'Channel for showing progress notifications',
        importance: Importance.high,
        priority: Priority.high,
        showProgress: true,
        maxProgress: 100,
        progress: i,
      );

      final NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
      );

      await flutterLocalNotificationsPlugin.show(
        1,
        'Downloading...',
        '$i% completed',
        platformChannelSpecifics,
        payload: 'progress_payload',
      );
    }

    // After progress complete, show completed notification
    const AndroidNotificationDetails completeAndroidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'progress_channel_id',
      'progress_channel_name',
      channelDescription: 'Channel for showing progress notifications',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails completePlatformChannelSpecifics = NotificationDetails(
      android: completeAndroidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Download Complete',
      'The download has been completed successfully.',
      completePlatformChannelSpecifics,
      payload: 'progress_done',
    );
  }

  // Action Notification
  Future<void> _showActionNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'action_channel_id',
      'action_channel_name',
      channelDescription: 'Channel for showing action notifications',
      importance: Importance.max,
      priority: Priority.high,
      actions: [
        AndroidNotificationAction(
          'action_id_1',
          'Accept',
          showsUserInterface: true,
        ),
        AndroidNotificationAction(
          'action_id_2',
          'Decline',
          showsUserInterface: true,
        ),
      ],
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      2,
      'Action Required',
      'Please select an action',
      platformChannelSpecifics,
      payload: 'action_payload',
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
}
