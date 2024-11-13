import 'package:flutter/material.dart';
import 'package:pos/component/app_text_button.dart';
import 'package:pos/component/app_text_field.dart';
import 'package:pos/component/my_text.dart';
import 'package:pos/res/color/app_color.dart';
import 'package:pos/view/authentication/sign_up_view.dart';
import 'package:pos/view_model/authentication_view_model/authentication_view_model.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  /// form key
  final _formKey = GlobalKey<FormState>();
  final AuthenticationViewModel _authenticationViewModel = AuthenticationViewModel();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Container(
          width: 490,
          height: height * 0.44,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: AppColor.black.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 10)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.01,
              ),

              /// jan Ghani Name
              const MyText(
                title: "POS",
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
              SizedBox(
                height: height * 0.08,
              ),

              /// form
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        controller: emailController,
                        hintText: "Email",
                        width: 390,
                        height: height * 0.05,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter email";
                          } else if (!val.contains('@gmail.com')) {
                            return "Enter valid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      AppTextField(
                        controller: passwordController,
                        obscureText: true,
                        hintText: "password",
                        width:390,
                        height: height * 0.05,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Password";
                          } else if (val.length < 7) {
                            return "Password must be grater than 7 characters";
                          }
                          return null;
                        },
                      )
                    ],
                  )),
              SizedBox(
                height: height * 0.02,
              ),

              /// sign in  button
              AppTextButton(
                title: "Log In",
                textColor: AppColor.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                backgroundColor: AppColor.primaryColor,
                width: 170,
                height: 40,
                borderRadius: 12,
                onTap: () {
                  if(_formKey.currentState!.validate()){
                    _authenticationViewModel.signIn(context, emailController.text.toString(), passwordController.text.toString());
                  }
                },
              ),

              const Spacer(),
              Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupView()));
                      },
                      child: const MyText(
                        title: "Don't have an account",
                        fontSize: 16,
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
