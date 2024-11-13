
import 'package:flutter/material.dart';
import 'package:pos/component/app_text_field.dart';
import 'package:pos/component/my_text.dart';
import 'package:pos/res/color/app_color.dart';
import 'package:pos/view_model/authentication_view_model/authentication_view_model.dart';


class SignupView extends StatelessWidget {
  SignupView({super.key});

  /// form key
  final _formKey = GlobalKey<FormState>();

  final AuthenticationViewModel _authenticationViewModel = AuthenticationViewModel();

  final storeNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Container(
          width: 530,
          height: height * 0.56,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: AppColor.primaryColor.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 10)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.01,
              ),

              /// janGhani Name
              const MyText(
                title: "POS",
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
              SizedBox(
                height: height * 0.04,
              ),

              /// form
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        controller: storeNameController,
                        hintText: "Store Name",
                        width: 390,
                        height: 60,
                        validator: (val){
                          if(val!.isEmpty){
                            return "Enter Store Name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      AppTextField(
                        controller: emailController,
                        hintText: "Email",
                        width: 390,
                        height: 60,
                        validator: (val){
                          if(val!.isEmpty){
                            return "Enter email";
                          }else if(!val.contains('@gmail.com')){
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
                        hintText: "Password",
                        width: 390,
                        height: 60,
                        validator: (val){
                          if(val!.isEmpty){
                            return "Enter Password";
                          }else if(val.length < 7){
                            return "Password must be grater than 7 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      AppTextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        hintText: "Confirm password",
                        width: 390,
                        height: 60,
                        validator: (val){
                          if(val!.isEmpty){
                            return "Enter Confirm Password";
                          }
                          else if(passwordController.text != val){
                            return "Confirm password not matched!";
                          }
                          return null;
                        },
                      )
                    ],
                  )),
              SizedBox(
                height: height * 0.03,
              ),

              /// sign in  button
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 16)
                ),
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    print("Working >>>>>>>>>>>>>>");
                    _authenticationViewModel.signUp(context, storeNameController.text.toString(), emailController.text.toString(), passwordController.text.toString());
                  }
                },
                child: const MyText(
                  title: "Sign Up",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,
                ),
              ),


              const Spacer(),
              Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const MyText(
                        title: "Already have an account",
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