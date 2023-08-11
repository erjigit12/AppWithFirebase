import 'package:bir_urma_clone/src/components/text_button_widget.dart';
import 'package:bir_urma_clone/src/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SunushPikirlerPage extends StatelessWidget {
  const SunushPikirlerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sunushPikirlerController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 20,
          height: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFC6DEF3),
          ),
          child: ChangeNotifierProvider(
            create: (context) => ProfileController(),
            child: Consumer<ProfileController>(
              builder: (context, provider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: sunushPikirlerController,
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
                            if (sunushPikirlerController.text != "") {
                              provider.sunushPikir(context,
                                  sunushPikirlerController.text.trim());
                            } else {
                              final snackBar = SnackBar(
                                content:
                                    const Text('Please white the message!'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {},
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          text: 'Жонотуу',
                          color: const Color(0xFF1A71B8),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
