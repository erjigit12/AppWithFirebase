import 'package:bir_urma_clone/src/modules/profile/views/change_email_page.dart';
import 'package:bir_urma_clone/src/modules/profile/views/change_password_page.dart';
import 'package:bir_urma_clone/src/components/profile_info_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class ProfildiOndoo extends StatelessWidget {
  const ProfildiOndoo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: ProfilInfoWidget(),
          ),
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ChangeEmailPage();
                    },
                  ),
                );
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Профиль',
                        style: AppTextStyle.f24w500,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(thickness: 2),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ChangePasswordPage();
                    },
                  ),
                );
              },
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Коопсуздук',
                        style: AppTextStyle.f24w500,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(thickness: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
