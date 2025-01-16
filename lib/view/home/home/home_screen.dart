import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone_app/controller/auth/auth_cubit.dart';
import 'package:instagram_clone_app/core/helpers/navigation_helper.dart';
import 'package:instagram_clone_app/core/style/widgets/story_icon.dart';
import 'package:instagram_clone_app/view/auth/sign_in_screen.dart';
import 'package:instagram_clone_app/view/home/home/storys_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.r),
          width: MediaQuery.of(context).size.width,
      
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 128.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/instagram text logo.png"),
                            fit: BoxFit.cover)),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_box_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              // Container( height: 150.h,  child: StorysIcons()),
              Text("Home Screen"),
              TextButton(
                  onPressed: () {
                    cubit.logOut().then((onValue) {
                      NavigationHelper.goOffAll(context, SignInScreen());
                    });
                  },
                  child: Text("Log Out")),
            ],
          ),
        ),
      ),
    );
  }
}
