// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers, avoid_print, unnecessary_null_comparison

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:flutter_capstone/screens/profile/profile_screen.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/screens/edit_profile/edit_profile_view_model.dart';
import 'package:intl/intl.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  final int id;
  const EditProfileScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  XFile? selectedImage;
  List? _imageFile;
  String? uploadImage;
  Future<File>? imageFile;
  Image? imageFromPreferences;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _obscureText = true;

  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];
  final currentDate = DateTime.now();
  String? selectedValue;

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)?.settings.arguments as EditProfileArguments?;
    if (args?.profileModel?.data.gender != null) {
      selectedValue = args?.profileModel?.data.gender;
    } else {
      selectedValue = 'Male';
    }
    super.didChangeDependencies();
  }

  void updateSelectedValue(String? value) {
    setState(() {
      selectedValue = value;
    });
  }

  _showConfirmationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/edit_profile/edit-profile.png",
                        width: 136,
                        height: 125,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Apakah kamu yakin ingin keluar?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: medium,
                          color: SourceColor().black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/profile-screen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PrimaryColor().primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      minimumSize: const Size(328, 50),
                    ),
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: medium,
                        color: SourceColor().white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PrimaryColor().onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(
                          color: PrimaryColor().primary,
                        ),
                      ),
                      minimumSize: const Size(328, 50),
                    ),
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: medium,
                        color: PrimaryColor().primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _showSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/edit_profile/edit-success.png",
                width: 191,
                height: 139,
              ),
              const SizedBox(height: 8),
              Text(
                'Akun kamu berhasil diedit',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: medium,
                  color: SourceColor().black,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const BottomNavScreen(selectedIndex: 2)));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(328, 50),
                  backgroundColor: PrimaryColor().primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text(
                  'Back to Home',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: SourceColor().white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    try {
      if (image != null) {
        setState(() {
          setImageFile(image);
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  void setImageFile(XFile? file) async {
    if (file != null) {
      setState(() {
        _imageFile = [file];
        uploadImage = file.path;
      });
    }
  }

  loadImageFromPreferences() {
    Utility.getImageFromPreferences().then((img) {
      if (null == img) {
        return;
      }
      setState(() {
        imageFromPreferences = Utility.imageFromBase64String(img);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as EditProfileArguments?;
    var name = args?.profileModel?.data.name;
    var company = args?.profileModel?.data.company;
    var email = args?.profileModel?.data.email;

    return Consumer<EditProfileViewModel>(builder: (context, profile, child) {
      return Scaffold(
        backgroundColor: SourceColor().white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              _showConfirmationBottomSheet(context);
            },
          ),
          backgroundColor: SourceColor().white,
          elevation: 0,
          title: Text(
            "Profile",
            style: setTextStyle(NeutralColor().neutral12).copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    height: 175,
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        children: [
                          FutureBuilder(
                            future: imageFile,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Utility.saveImageToPreferences(
                                    Utility.base64String(
                                        snapshot.data!.readAsBytesSync()));
                                return ClipOval(
                                    child: Image.file(
                                  snapshot.data!,
                                  width: 100,
                                  height: 100,
                                ));
                              } else {
                                return SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        SecondaryColor().secondaryFixedDim,
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              minimumSize: const Size(140, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: BorderSide(
                                  color: SourceColor().seed,
                                  width: 1,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              await pickImageFromGallery();
                              setState(() {
                                imageFromPreferences = null;
                              });
                              loadImageFromPreferences();
                            },
                            child: Text(
                              "Change Photo",
                              style:
                                  setTextStyle(PrimaryColor().primary).copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          initialValue: name,
                          onSaved: (val) {
                            name = val;
                          },
                          decoration: InputDecoration(
                            labelText: 'Nama',
                            hintStyle: setTextStyle(
                              const Color(0xFF44474E),
                            ).copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            hintText: 'Input Full Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        TextFormField(
                          initialValue: company,
                          onSaved: (val) {
                            company = val;
                          },
                          decoration: InputDecoration(
                            labelText: 'Company',
                            hintStyle: setTextStyle(
                              const Color(0xFF44474E),
                            ).copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            hintText: 'Input Company Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        TextFormField(
                          initialValue: email,
                          onSaved: (val) {
                            email = val;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintStyle: setTextStyle(
                              const Color(0xFF44474E),
                            ).copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            hintText: 'Input Email',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                            labelText: 'Password',
                            hintStyle: setTextStyle(
                              const Color(0xFF44474E),
                            ).copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            hintText: 'Input Password',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gender",
                                style: setTextStyle(
                                  NeutralColor().neutral30,
                                ).copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "Male",
                                        groupValue: selectedValue,
                                        visualDensity: const VisualDensity(
                                          horizontal:
                                              VisualDensity.minimumDensity,
                                          vertical:
                                              VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        onChanged: (value) {
                                          updateSelectedValue(value!);
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('Male'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "Female",
                                        groupValue: selectedValue,
                                        visualDensity: const VisualDensity(
                                          horizontal:
                                              VisualDensity.minimumDensity,
                                          vertical:
                                              VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        onChanged: (value) {
                                          updateSelectedValue(value!);
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('Female'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "Other",
                                        groupValue: selectedValue,
                                        visualDensity: const VisualDensity(
                                          horizontal:
                                              VisualDensity.minimumDensity,
                                          vertical:
                                              VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        onChanged: (value) {
                                          updateSelectedValue(value!);
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('Other'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: TextFormField(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext contet) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: CalendarDatePicker2(
                                        config: CalendarDatePicker2Config(
                                          firstDate: DateTime(1990),
                                          lastDate:
                                              DateTime(currentDate.year + 5),
                                          currentDate: DateTime.now(),
                                        ),
                                        value:
                                            _singleDatePickerValueWithDefaultValue,
                                        onValueChanged: (value) {
                                          DateTime? dateBirth = value[0];
                                          if (dateBirth != null) {
                                            setState(() {
                                              _singleDatePickerValueWithDefaultValue =
                                                  value;
                                              _dateController.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(dateBirth);
                                            });
                                          }
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            readOnly: true,
                            autofocus: true,
                            controller: _dateController,
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.calendar_today_rounded),
                              labelText: 'Date Birth',
                              hintStyle: setTextStyle(
                                const Color(0xFF44474E),
                              ).copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                              hintText: "YYYY/MM/DD",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: FractionallySizedBox(
                            widthFactor: 1.0,
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFF005DB9)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  final form = formKey.currentState;
                                  if (form != null && form.validate()) {
                                    form.save();
                                    _showSuccessBottomSheet(context);
                                    try {
                                      await profile.updateProfile(
                                        {
                                          "company": company,
                                          "email": email,
                                          "name": name,
                                          "password": _passwordController.text,
                                          "gender": selectedValue,
                                          "dateBirth": _dateController.text,
                                        },
                                        widget.id,
                                      );
                                    } catch (e) {
                                      throw e.toString();
                                    }
                                  }
                                },
                                child: Text(
                                  "Save Change",
                                  style: setTextStyle(SourceColor().white)
                                      .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
