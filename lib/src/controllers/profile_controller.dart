// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'dart:io';
import 'package:bir_urma_clone/src/controllers/session_controller.dart';
import 'package:bir_urma_clone/src/utils/routes/route_name.dart';
import 'package:bir_urma_clone/src/utils/utils_error_message/error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../components/text_button_widget.dart';
import '../constants/constants.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileController extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  final ImagePicker picker = ImagePicker();
  final DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  XFile? _image;
  XFile? get image => _image;

  Future getGalleryImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      notifyListeners();
      uploadImage(context);
    }
  }

  Future getCameraImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );

    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      notifyListeners();
      uploadImage(context);
    }
  }

  void pickImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 25, left: 25),
                child: Row(
                  children: [
                    Text(
                      'Аватарды озгортуу',
                      style: AppTextStyle.f22w500,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          getCameraImage(context);
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset('assets/svg/camera.svg')),
                    const SizedBox(width: 20),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          getGalleryImage(context);
                        },
                        child: SvgPicture.asset('assets/svg/galery.svg')),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset('assets/svg/delete.svg')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void uploadImage(BuildContext context) async {
    setLoading(true);

    firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('/profileImage' + SessionController().userId.toString());
    firebase_storage.UploadTask uploadTask =
        storageRef.putFile(File(image!.path).absolute);

    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    ref.child(SessionController().userId.toString()).update({
      'profile': newUrl.toString(),
    }).then((value) {
      Utils.toastMessage('Profile update');
      setLoading(false);
      _image = null;
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
    });
  }

  Future<void> changeProfileData(
    BuildContext context,
    String userName,
    String email,
    String phone,
  ) async {
    setLoading(true);

    ref.child(SessionController().userId.toString()).update({
      'userName': userName.toString(),
      'email': email.toString(),
      'phone': phone.toString(),
    }).then((value) {
      setLoading(false);
      Navigator.pop(context);
      Utils.toastMessage('Profile Updated');
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
    });
  }

  void changePassword(
      BuildContext context, email, oldPassword, newPassword) async {
    final cred =
        EmailAuthProvider.credential(email: email, password: oldPassword);

    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newPassword);
      ref.child(SessionController().userId.toString()).update({
        'password': newPassword,
      }).then((value) {
        showPasswordDiolog(context);
      }).onError((error, stackTrace) {
        Utils.toastMessage(error.toString());
      });
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }

  void showPasswordDiolog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Ийгилик!'),
              const SizedBox(height: 40),
              const Text(
                'Сыр соз озгортулду. Жаны сыр соз сакталды.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7F7E7E),
                ),
              ),
              const SizedBox(height: 20),
              TextButtonWidget(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.profileScreen);
                },
                text: 'OK',
                color: Colors.blue.shade600,
              ),
            ],
          ),
        );
      },
    );
  }

  void showShareLinkDiolog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          width: 20,
          child: AlertDialog(
            alignment: Alignment.bottomRight,
            backgroundColor: const Color(0xFFE7F1FF),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.filter_none,
                      size: 20,
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Text(
                        'Ссылканы кочуруу',
                        style: AppTextStyle.f20w400,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Divider(thickness: 1),
                ),
                GestureDetector(
                  onTap: () {
                    shareLink();
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.reply_outlined,
                        size: 30,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          'Башка тиркемеде болушуу',
                          textAlign: TextAlign.start,
                          style: AppTextStyle.f20w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void shareLink() {}

  void showSunushPikirlerDiolog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5, 5),
                    blurRadius: 30,
                    spreadRadius: 15,
                    color: Colors.blue.withOpacity(0.2),
                  ),
                ],
              ),
              child: const Image(
                image: AssetImage(
                  'assets/images/check_circle.png',
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ыраазычылык билдиребиз',
              textAlign: TextAlign.center,
              style: AppTextStyle.f24w500,
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Сиздин ойунуз биз учун маанилуу',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF9B9898),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButtonWidget(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.profileScreen);
              },
              text: 'OK',
              color: const Color(0xFF1A71B8),
            ),
          ],
        ),
      ),
    );
  }

  void sunushPikir(BuildContext context, sms) async {
    await ref.child(SessionController().userId.toString()).update({
      'sunush-pikir': sms,
    }).then((value) {
      showSunushPikirlerDiolog(context);
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }
}
