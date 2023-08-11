import 'package:bir_urma_clone/src/constants/constants.dart';
import 'package:bir_urma_clone/src/utils/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/email_password_field.dart';
import '../../../components/round_button.dart';
import '../../../controllers/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final passwordController = TextEditingController();

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    passwordController.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('/SignUp'),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => SignUpController(),
          child: Consumer<SignUpController>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        EmailPasswordFieldWidget(
                          text: 'Ысым',
                          controller: nameController,
                          focusNode: emailFocusNode,
                          keyBoardType: TextInputType.emailAddress,
                          onFieldSubmittedValue: (newValue) {},
                          onValidator: (value) {
                            return value.isEmpty ? 'enter name' : null;
                          },
                        ),
                        const SizedBox(height: 20),
                        EmailPasswordFieldWidget(
                          text: 'Email',
                          controller: emailController,
                          focusNode: emailFocusNode,
                          keyBoardType: TextInputType.emailAddress,
                          onFieldSubmittedValue: (newValue) {},
                          onValidator: (value) {
                            return value.isEmpty ? 'enter email' : null;
                          },
                        ),
                        const SizedBox(height: 20),
                        EmailPasswordFieldWidget(
                          text: 'Тел.номер',
                          controller: phoneNoController,
                          focusNode: phoneFocusNode,
                          keyBoardType: TextInputType.emailAddress,
                          onFieldSubmittedValue: (newValue) {},
                          onValidator: (value) {
                            return value.isEmpty ? 'enter phone' : null;
                          },
                        ),
                        const SizedBox(height: 20),
                        EmailPasswordFieldWidget(
                          text: 'Password',
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          keyBoardType: TextInputType.emailAddress,
                          onFieldSubmittedValue: (newValue) {},
                          onValidator: (value) {
                            return value.isEmpty ? 'enter password' : null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  RoundButton(
                    title: 'Register',
                    loading: provider.loading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        provider.signup(
                          context,
                          nameController.text.trim(),
                          emailController.text.trim(),
                          phoneNoController.text.trim(),
                          passwordController.text.trim(),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.loginScreen);
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: 'Already have an account?',
                        children: [
                          TextSpan(text: ' Login', style: AppTextStyle.f18w500),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
