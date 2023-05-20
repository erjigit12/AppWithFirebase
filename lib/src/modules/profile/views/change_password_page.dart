import 'package:bir_urma_clone/src/components/email_password_field.dart';
import 'package:bir_urma_clone/src/components/text_button_widget.dart';
import 'package:bir_urma_clone/src/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isObscure1 = true;
  bool isObscure2 = true;
  bool isObscure3 = true;

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
          const SizedBox(height: 90),
          EmailPasswordFieldWidget(
            text: 'Сыр соз',
            obscureText: isObscure1,
            suffixIcon: IconButton(
              icon: Icon(
                isObscure1 ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  isObscure1 = !isObscure1;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          EmailPasswordFieldWidget(
            text: 'Жаны сыр соз',
            obscureText: isObscure2,
            suffixIcon: IconButton(
              icon: Icon(
                isObscure2 ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  isObscure2 = !isObscure2;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          EmailPasswordFieldWidget(
            text: 'Жаны сыр созду кайталап жазыныз',
            suffixIcon: IconButton(
              icon: Icon(
                isObscure3 ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  isObscure3 = !isObscure3;
                });
              },
            ),
            obscureText: isObscure3,
          ),
          const SizedBox(height: 360),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Colors.blue.shade700,
                fixedSize: Size(
                  MediaQuery.of(context).size.width,
                  60,
                ),
              ),
              onPressed: () {
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const ProfileView();
                                  },
                                ),
                              );
                            },
                            text: 'OK',
                            color: Colors.blue.shade600,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text(
                'Сыр созду озгортуу',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
