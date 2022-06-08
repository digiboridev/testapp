import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/core/colors.dart';
import 'package:testapp/core/validators.dart';
import 'package:testapp/ui/widgets/default_form_field.dart';

class SignUpScreen extends StatefulWidget {
  final Future Function({
    required String email,
    required String password,
  }) signUpWithEmail;

  final Function switchToSignIn;

  const SignUpScreen(
      {Key? key, required this.signUpWithEmail, required this.switchToSignIn})
      : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _emailEC = TextEditingController();
  final TextEditingController _passEC = TextEditingController();

  // Validate form and submit if valid
  onSign() {
    bool formValid = _form.currentState?.validate() ?? false;
    if (formValid) {
      widget.signUpWithEmail(email: _emailEC.text, password: _passEC.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox.expand(
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(fontSize: Get.width * 0.06),
              ),
              SizedBox(
                height: Get.width * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                child: buildEmailField(),
              ),
              SizedBox(
                height: Get.width * 0.06,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                child: buildPasswordField(),
              ),
              SizedBox(
                height: Get.width * 0.1,
              ),
              buildSignButton(),
              SizedBox(
                height: Get.width * 0.1,
              ),
              buildAuthVariant()
            ],
          ),
        ),
      )),
    );
  }

  Widget buildSignButton() {
    return GestureDetector(
        onTap: () => onSign(),
        child: Container(
            decoration: BoxDecoration(
                color: MainColors.accent,
                borderRadius: BorderRadius.circular(Get.width * 0.04)),
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.04, vertical: Get.width * 0.03),
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.white),
            )));
  }

  Widget buildAuthVariant() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already registered?'),
        SizedBox(
          width: Get.width * 0.01,
        ),
        GestureDetector(
          onTap: () => widget.switchToSignIn(),
          child: Text(
            'Sign In',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

  Widget buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
      child: defaultFormField(
        textEditingController: _emailEC,
        validator: emailValidator,
        hint: 'Email',
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
      child: defaultFormField(
        textEditingController: _passEC,
        validator: passwordValidator,
        hint: 'Password',
      ),
    );
  }
}
