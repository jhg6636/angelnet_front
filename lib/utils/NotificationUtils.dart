import 'package:angelnet/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<String?> fcmSetting() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: 'AIzaSyDJfuOJwJMo1vWA_UmapTFTKOlSNRh0OR8',
  //         appId: '1:807437189527:web:73f6b2c161df35396044d2',
  //         messagingSenderId: '807437189527',
  //         projectId: 'angelnet-bcded'
  //     )
  // );
  
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await messaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true
  );

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true
  );

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'angelnet_notification', 'angelnet_notification', importance: Importance.max);

  final FlutterLocalNotificationsPlugin plugin = FlutterLocalNotificationsPlugin();

  await plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

  FirebaseMessaging.onMessage.listen((remoteMessage) {
    RemoteNotification? notification = remoteMessage.notification;

    if (notification != null) {
      plugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
            ),
          )
      );
    }
  });

  String? firebaseToken = await messaging.getToken();
  
  return firebaseToken;
}