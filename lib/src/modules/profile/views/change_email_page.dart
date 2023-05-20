import 'package:bir_urma_clone/src/components/email_password_field.dart';
import 'package:bir_urma_clone/src/components/text_button_widget.dart';
import 'package:bir_urma_clone/src/constants/text_style/app_text_style.dart';
import 'package:bir_urma_clone/src/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeEmailPage extends StatelessWidget {
  const ChangeEmailPage({Key? key}) : super(key: key);
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
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
                                SvgPicture.asset('assets/svg/camera.svg'),
                                const SizedBox(width: 20),
                                SvgPicture.asset('assets/svg/galery.svg'),
                                const SizedBox(width: 20),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child:
                                      SvgPicture.asset('assets/svg/delete.svg'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        'assets/images/men1.png',
                      ),
                    ),
                  ),
                  Positioned(
                    left: 230,
                    top: 70,
                    child: Icon(
                      Icons.camera_alt,
                      color: Color(0xFF1A80D4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 60),
          const EmailPasswordFieldWidget(text: 'Ысым'),
          const SizedBox(height: 20),
          const EmailPasswordFieldWidget(text: 'Email'),
          const SizedBox(height: 20),
          const EmailPasswordFieldWidget(text: 'Тел.номер'),
          const SizedBox(height: 270),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButtonWidget(
                onPressed: () {},
                text: 'Сактоо',
                color: const Color(0xFF1D88DF),
              ),
              TextButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ProfileView();
                      },
                    ),
                  );
                },
                text: 'Артка',
                color: const Color(0xFF6F6E6E),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
