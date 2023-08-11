import 'dart:io';

import 'package:bir_urma_clone/src/components/email_password_field.dart';
import 'package:bir_urma_clone/src/components/text_button_widget.dart';
import 'package:bir_urma_clone/src/constants/profile_constants/colors/profile_colors.dart';
import 'package:bir_urma_clone/src/controllers/profile_controller.dart';
import 'package:bir_urma_clone/src/controllers/session_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({Key? key}) : super(key: key);

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref().child('User');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Профилди ондоо',
          style: TextStyle(
            color: Color(0xFF888080),
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context, provider, child) {
            return SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: StreamBuilder(
                      stream: ref
                          .child(SessionController().userId.toString())
                          .onValue,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasData) {
                          Map<dynamic, dynamic> map =
                              snapshot.data.snapshot.value;
                          final userNameController =
                              TextEditingController(text: map['userName']);
                          final emailController =
                              TextEditingController(text: map['email']);
                          final phoneNumberController =
                              TextEditingController(text: map['phone']);
                          return Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Center(
                                      child: Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppProfileColors.grey2Color,
                                            width: 3,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: provider.image == null
                                              ? map['profile'].toString() == ""
                                                  ? const Icon(Icons.person,
                                                      size: 35)
                                                  : Image(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          map['profile']
                                                              .toString()),
                                                      loadingBuilder: (context,
                                                          child,
                                                          loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) {
                                                          return child;
                                                        }
                                                        return const Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      },
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return const Icon(
                                                          Icons.error_outline,
                                                          size: 35,
                                                          color: AppProfileColors
                                                              .cameraIconColor,
                                                        );
                                                      },
                                                    )
                                              : Stack(
                                                  children: [
                                                    Image.file(
                                                      File(provider.image!.path)
                                                          .absolute,
                                                    ),
                                                    const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      provider.pickImage(context);
                                    },
                                    child: const CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          AppProfileColors.blackColor,
                                      child: Icon(Icons.add, size: 20),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 60),
                              EmailPasswordFieldWidget(
                                text: 'Ысым',
                                controller: userNameController,
                                onFieldSubmittedValue: (newValue) {},
                                keyBoardType: TextInputType.text,
                              ),
                              const SizedBox(height: 20),
                              EmailPasswordFieldWidget(
                                text: 'Email',
                                controller: emailController,
                                onFieldSubmittedValue: (newValue) {},
                                keyBoardType: TextInputType.text,
                              ),
                              const SizedBox(height: 20),
                              EmailPasswordFieldWidget(
                                text: 'Тел.номер',
                                controller: phoneNumberController,
                                onFieldSubmittedValue: (newValue) {},
                                keyBoardType: TextInputType.text,
                              ),
                              const SizedBox(height: 270),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButtonWidget(
                                    onPressed: () async {
                                      await provider.changeProfileData(
                                        context,
                                        userNameController.text.trim(),
                                        emailController.text.trim(),
                                        phoneNumberController.text.trim(),
                                      );
                                    },
                                    text: 'Сактоо',
                                    color: const Color(0xFF1D88DF),
                                  ),
                                  TextButtonWidget(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    text: 'Артка',
                                    color: const Color(0xFF6F6E6E),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                          return const Center(
                            child: Text('Something went wrong'),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
