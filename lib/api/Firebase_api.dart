import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
  }
}


/*
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer'; // Dùng log thay vì print

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    try {
      // Yêu cầu quyền thông báo từ người dùng
      NotificationSettings settings = await _firebaseMessaging.requestPermission();
      
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        // Lấy FCM Token
        final fCMToken = await _firebaseMessaging.getToken();
        log('FCM Token: $fCMToken'); 

        // Lắng nghe khi token thay đổi
        FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
          log('FCM Token Updated: $newToken');
        });
      } else {
        log('Người dùng từ chối quyền thông báo.');
      }
    } catch (e) {
      log('Lỗi khi khởi tạo Firebase: $e');
    }
  }
}

*/