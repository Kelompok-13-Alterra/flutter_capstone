import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/notification/notification_model.dart';
import 'package:flutter_capstone/services/notification/notification_service.dart';

class NotificationViewModel with ChangeNotifier {
  NotificationModel? _notificationModel;
  NotificationModel get getNotificationModel =>
      _notificationModel ?? NotificationModel();
  NotificationService notificationService = NotificationService();

  Future<NotificationModel?> getNotification() async {
    try {
      _notificationModel = await notificationService.getNotification();
      notifyListeners();
      return _notificationModel;
    } catch (e) {
      rethrow;
    }
  }
}
