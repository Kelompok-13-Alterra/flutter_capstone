import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/notification/mark_as_read.dart';
import 'package:flutter_capstone/services/notification/mark_as_read_service.dart';

class MarkAsReadViewModel with ChangeNotifier {
  MarkAsReadModel? _markAsReadModel;
  MarkAsReadModel get getMarkAsReadModel =>
      _markAsReadModel ?? MarkAsReadModel();
  MarkAsReadService markAsReadService = MarkAsReadService();

  Future<MarkAsReadModel?> getMarkAsRead() async {
    try {
      _markAsReadModel = await markAsReadService.markNotification();
      notifyListeners();
      return _markAsReadModel;
    } catch (e) {
      rethrow;
    }
  }
}
