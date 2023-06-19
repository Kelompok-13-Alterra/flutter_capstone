import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/edit_profile/edit_profile_model.dart';
import 'package:flutter_capstone/services/edit_profile/edit_profile_services.dart';

class EditProfileViewModel with ChangeNotifier {
  List<Profile> _listProfile = [];
  List<Profile> get listProfile => _listProfile;

  Future<void> updateProfile(Map<String, dynamic> data, int id) async {
    try {
      List<Profile>? updatedList =
          await EditProfileService().putProfileData(data, id);
      if (updatedList != null) {
        _listProfile = updatedList;
        notifyListeners();
      } else {
        // Handle case when the data is null
      }
    } catch (e) {
      rethrow;
    }
  }
}
