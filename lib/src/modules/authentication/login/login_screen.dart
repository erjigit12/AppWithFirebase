import 'package:bir_urma_clone/src/controllers/login_controller.dart';
import 'package:bir_urma_clone/src/utils/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/email_password_field.dart';
import '../../../components/round_button.dart';
import '../../../constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('/Login'),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => LoginController(),
          child: Consumer<LoginController>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.forgotPasswordScreen);
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          ' Forgot password',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 20,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  RoundButton(
                    title: 'Login',
                    loading: provider.loading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        provider.login(
                          context,
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.signupScreen);
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: 'For Register click here!',
                        children: [
                          TextSpan(
                              text: ' SignUp', style: AppTextStyle.f18w500),
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
