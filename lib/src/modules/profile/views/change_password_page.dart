import 'package:bir_urma_clone/src/components/email_password_field.dart';
import 'package:bir_urma_clone/src/controllers/profile_controller.dart';
import 'package:bir_urma_clone/src/utils/utils_error_message/error.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/session_controller.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isObscure1 = true;
  bool isObscure2 = true;
  bool isObscure3 = true;

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        create: (context) => ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context, provider, child) {
            return Column(
              children: [
                const SizedBox(height: 90),
                EmailPasswordFieldWidget(
                  text: 'Сыр соз',
                  controller: oldPasswordController,
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
                  controller: newPasswordController,
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
                  controller: confirmPasswordController,
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
                  child: StreamBuilder(
                    stream: provider.ref
                        .child(SessionController().userId.toString())
                        .onValue,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        Map<dynamic, dynamic> map =
                            snapshot.data.snapshot.value;

                        return ElevatedButton(
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
                            if (newPasswordController.text ==
                                confirmPasswordController.text) {
                              provider.changePassword(
                                context,
                                map['email'],
                                oldPasswordController.text.trim(),
                                newPasswordController.text.trim(),
                              );
                            } else {
                              Utils.toastMessage('Password does not match');
                            }
                          },
                          child: const Text(
                            'Сыр созду озгортуу',
                            style: TextStyle(fontSize: 20),
                          ),
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
            );
          },
        ),
      ),
    );
  }
}
