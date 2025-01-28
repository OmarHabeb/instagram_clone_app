import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone_app/controller/home/home_cubit.dart';
import 'package:instagram_clone_app/core/helpers/navigation_helper.dart';
import 'package:instagram_clone_app/core/style/widgets/story_icon.dart';
import 'package:instagram_clone_app/view/home/profile/edit_profile/edit_profile_screen.dart';
import 'package:instagram_clone_app/view/home/profile/page_widget.dart';
import 'package:instagram_clone_app/view/home/profile/upload_post_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.r),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is GetUserDataLoadingState) {
                        return CircularProgressIndicator();
                      }
                      return Text(
                        cubit.userModel.name.toString(),
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            NavigationHelper.goTo(context, Post());
                          },
                          icon: Icon(Icons.my_library_add_sharp)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.menu))
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StoryIcon(image: cubit.getUserImage().toString()),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(cubit.Posts.length.toString()),
                          Text('Posts'),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        children: [
                          Text('0'),
                          Text('Followers'),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        children: [
                          Text('0'),
                          Text('Following'),
                        ],
                      )
                    ],
                  )
                ],
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is GetUserDataLoadingState) {
                    return CircularProgressIndicator();
                  }
                  return Text(
                    cubit.userModel.name.toString(),
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  );
                },
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 30.h,
                    color: const Color.fromARGB(115, 51, 51, 51),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          NavigationHelper.goTo(context, EditProfileScreen());
                        },
                        child: Text(
                          'Edit profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                      height: 30.h,
                      color: const Color.fromARGB(115, 51, 51, 51),
                      child: Icon(Icons.arrow_drop_down))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              PageWidget()
            ],
          ),
        ),
      ),
    );
  }
}
