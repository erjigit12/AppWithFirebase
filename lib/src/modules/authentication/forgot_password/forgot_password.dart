import 'package:bir_urma_clone/src/controllers/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/email_password_field.dart';
import '../../../components/round_button.dart';
import '../../../constants/constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('/Forgot Password'),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => ForgotPasswordController(),
          child: Consumer<ForgotPasswordController>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Forgot Password',
                    style: AppTextStyle.f20w500,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Enter your email\nto recover your password',
                    style: AppTextStyle.f18w500,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 100),
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  RoundButton(
                    title: 'Recover',
                    loading: provider.loading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        provider.forgotPassword(
                          context,
                          emailController.text.trim(),
                        );
                      }
                    },
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
