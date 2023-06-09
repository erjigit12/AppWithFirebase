import 'package:bir_urma_clone/src/components/text_button_widget.dart';
import 'package:bir_urma_clone/src/constants/text_style/app_text_style.dart';
import 'package:bir_urma_clone/src/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

class SunushPikirlerPage extends StatelessWidget {
  const SunushPikirlerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 20,
          height: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFC6DEF3),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    fillColor: const Color(0xFFF4F0F0),
                    filled: true,
                    hintText: 'Сунуш-пикирлер',
                    hintStyle: const TextStyle(fontSize: 22),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  minLines: 13,
                  maxLines: 100,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButtonWidget(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Артка',
                    color: const Color(0xFF6F6E6E),
                  ),
                  TextButtonWidget(
                    onPressed: () {
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
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ProfileView(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                text: 'OK',
                                color: const Color(0xFF1A71B8),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    text: 'Жонотуу',
                    color: const Color(0xFF1A71B8),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
