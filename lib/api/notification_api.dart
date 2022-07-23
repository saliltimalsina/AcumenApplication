// ignore_for_file: prefer_const_constructors

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future _notificationDetails() async {
  return NotificationDetails(
    android: AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
    ),
    iOS: IOSNotificationDetails(),
  );
}

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);
}
