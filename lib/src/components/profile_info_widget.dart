import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../constants/profile_constants/colors/profile_colors.dart';
import '../controllers/profile_controller.dart';
import '../controllers/session_controller.dart';

class ProfilInfoWidget extends StatelessWidget {
  const ProfilInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref().child('User');
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ChangeNotifierProvider(
        create: (_) => ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context, provider, child) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: StreamBuilder(
                  stream:
                      ref.child(SessionController().userId.toString()).onValue,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                      return Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppProfileColors.grey2Color,
                                width: 3,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: provider.image == null
                                  ? map['profile'].toString() == ""
                                      ? const Icon(Icons.person, size: 35)
                                      : Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              map['profile'].toString()),
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) {
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
                                          File(provider.image!.path).absolute,
                                        ),
                                        const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                map['userName'],
                                style: AppTextStyle.f24w500,
                              ),
                              const SizedBox(height: 8),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(map['phone']),
                                  Text(map['email']),
                                ],
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
            );
          },
        ),
      ),
      // child: Row(
      //   children: [
      //     CircleAvatar(
      //       radius: 40,
      //       backgroundImage: AssetImage('assets/images/men1.png'),
      //     ),
      //     SizedBox(width: 10),
      //     Column(
      //       children: [
      //         Text(
      //           'Аты Жону',
      //           style: AppTextStyle.f24w500,
      //         ),
      //         SizedBox(height: 8),
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Text('+996700123456'),
      //             Text('example@gmail.com'),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
