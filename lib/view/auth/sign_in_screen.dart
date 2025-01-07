import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone_app/controller/auth/auth_cubit.dart';
import 'package:instagram_clone_app/core/helpers/navigation_helper.dart';
import 'package:instagram_clone_app/core/style/widgets/text_field_widget.dart';
import 'package:instagram_clone_app/view/auth/sign_up_screen.dart';
import 'package:instagram_clone_app/view/home/home_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    NavigationHelper.goOffAll(context, HomeScreen());
                  }
                  else if (state is LoginFailedState) {
                    print("error");
                  }
                },
                child:  InkWell(
                onTap: () {
                
                  cubit
                      .login(
                          email: emailController.text,
                          password: passwordController.text);
                   
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
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
                  child: Text("sign up"))
            ],
          ),
        ),
      ),
    );
  }
}
