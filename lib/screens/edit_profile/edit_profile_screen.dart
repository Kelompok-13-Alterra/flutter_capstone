import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/screens/edit_profile/edit_profile_view_model.dart';

import 'package:intl/intl.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  final int id;
  const EditProfileScreen({
    super.key,
    required this.id,
  });
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  XFile? selectedImage;

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
  void initState() {
    super.initState();
    selectedValue = '';
  }

  void updateSelectedValue(String? value) {
    setState(() {
      selectedValue = value;
    });
  }

  Future<XFile?> pickImageFromGallery() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  @override
  Widget build(BuildContext context) {
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
              Navigator.pop(context);
            },
          ),
          backgroundColor: SourceColor().white,
          elevation: 0,
          title: Text(
            "Profile",
            style: setTextStyle(NeutralColor().neutral12).copyWith(
              fontWeight: regular,
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
                          CircleAvatar(
                            backgroundColor: SecondaryColor().secondaryFixedDim,
                            radius: 44,
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
                              XFile? image = await pickImageFromGallery();
                              if (image != null) {
                                setState(() {
                                  selectedImage = image;
                                });
                              }
                            },
                            child: Text(
                              "Change Photo",
                              style:
                                  setTextStyle(PrimaryColor().primary).copyWith(
                                fontWeight: regular,
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
                          controller: _nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Nama',
                            hintStyle: setTextStyle(
                              const Color(0xFF44474E),
                            ).copyWith(
                              fontWeight: regular,
                              fontSize: 16,
                            ),
                            hintText: 'Input Full Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        TextFormField(
                          controller: _companyController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter company name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Company',
                            hintStyle: setTextStyle(
                              const Color(0xFF44474E),
                            ).copyWith(
                              fontWeight: regular,
                              fontSize: 16,
                            ),
                            hintText: 'Input Company Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintStyle: setTextStyle(
                              const Color(0xFF44474E),
                            ).copyWith(
                              fontWeight: regular,
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
                          validator: (value) {
                            if (value != null && value.length < 5) {
                              return 'Enter min. 5 characters';
                            } else {
                              return null;
                            }
                          },
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
                              fontWeight: regular,
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
                                  fontWeight: semiBold,
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
                                        onChanged: updateSelectedValue,
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
                                        onChanged: updateSelectedValue,
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
                                        onChanged: updateSelectedValue,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Silahkan isikan tanggal";
                              } else {
                                return null;
                              }
                            },
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
                                fontWeight: regular,
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
                                      borderRadius: BorderRadius.circular(
                                          8), // Bentuk border
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  final valid =
                                      formKey.currentState!.validate();
                                  if (valid) {
                                    try {
                                      await profile.updateProfile(
                                        {
                                          "company": _companyController.text,
                                          "dateBirthInput":
                                              _dateController.text,
                                          "email": _emailController.text,
                                          "gender": selectedValue,
                                          "name": _nameController.text,
                                          "password": _passwordController.text
                                        },
                                        widget.id,
                                      );

                                      // ignore: use_build_context_synchronously
                                      Navigator.pop(context);
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  }
                                },
                                child: Text(
                                  'Save Change',
                                  style: setTextStyle(
                                    const Color(0xFFFFFFFF),
                                  ).copyWith(
                                    fontWeight: medium,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
