import 'package:flutter/material.dart';
// import 'package:flutter_capstone/model/edit_profile/edit_profile_model.dart';
import 'package:flutter_capstone/services/edit_profile/edit_profile_services.dart';

class EditProfileViewModel with ChangeNotifier {
  // List<Profile> _listProfile = [];
  // List<Profile> get listProfile => _listProfile;

  Future<void> updateProfile(Map data, int id) async {
    try {
      final updatedProfile =
          await EditProfileService().putProfileData(data, id);
      if (updatedProfile != null) {
        updatedProfile; // Convert the profile to a list
        notifyListeners();
      } else {
        // Handle case when the data is null
      }
    } catch (e) {
      rethrow;
    }
  }
}
