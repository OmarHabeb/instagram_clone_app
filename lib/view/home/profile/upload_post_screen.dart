import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone_app/controller/home/home_cubit.dart';
class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Stack(
                clipBehavior: Clip.none,
                children: [
                  BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                    if (state is PickPostLoadingState) {
                      return CircularProgressIndicator();
                    } else if (state is PickPostuccessState) {
                      return Container(
                        height: 80.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(cubit.imagePostFile!),
                                fit: BoxFit.fill)),
                      );
                    } else {
                      return Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            ),
                      );
                    }
                  }),
                  Positioned(
                    bottom: -18,
                    right: 13,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                          size: 30.r,
                        ),
                        onPressed: () {
                          cubit.pickUserPost();
                        },
                      ),
                    ),
                  )
                ],
              ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is PickPostuccessState) {
                return ElevatedButton(
                  onPressed: () {
                    cubit.uploadPost();
                    if (state is UploadPostSuccessState) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text("add post"),
                );
              }
              return  Container();
            },
          ),
        ],
      ),
    );
  }
}
