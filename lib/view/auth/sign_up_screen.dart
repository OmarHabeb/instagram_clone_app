import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone_app/controller/auth/auth_cubit.dart';
import 'package:instagram_clone_app/core/helpers/navigation_helper.dart';
import 'package:instagram_clone_app/core/style/widgets/text_field_widget.dart';
import 'package:instagram_clone_app/view/auth/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.r),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 244.w,
                height: 68.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/instagram text logo.png'),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                controller: nameController,
                text: 'name',
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                obscureText: false,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                controller: emailController,
                text: 'Email',
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                obscureText: false,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                controller: passwordController,
                text: 'Password',
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter your Password';
                  }
                  return null;
                },
                obscureText: false,
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  cubit
                      .register(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text)
                      .then((onValue) {
                    NavigationHelper.goTo(context, SignInScreen());
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                  onPressed: () {
                    NavigationHelper.goTo(context, SignUpScreen());
                  },
                  child: Text("aleardy have an account? Sign in"))
            ],
          ),
        ),
      ),
    );
  }
}
