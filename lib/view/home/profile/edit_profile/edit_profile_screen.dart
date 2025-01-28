import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone_app/controller/home/home_cubit.dart';
import 'package:instagram_clone_app/view/home/profile/edit_profile/profile_field.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    _nameController.text = cubit.userModel.name ?? "";
    _emailController.text = cubit.userModel.email ?? "";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                      )),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        cubit
                            .updateUserData(
                                name: _nameController.text,
                                email: _emailController.text,
                                image: cubit.imageProfileFile)
                            .then((onValue) {
                          cubit.getUserData();
                        });
                      },
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.blue, fontSize: 16.sp),
                      )),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                if (state is PickImageLoadingState) {
                  return CircularProgressIndicator();
                } else if (state is PickImageSuccessState) {
                  return Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: FileImage(cubit.imageProfileFile!),
                            fit: BoxFit.fill)),
                  );
                } else {
                  return Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                NetworkImage(cubit.getUserImage().toString()),
                            fit: BoxFit.fill)),
                  );
                }
              }),
              SizedBox(
                height: 10.h,
              ),
              TextButton(
                  onPressed: () {
                    cubit.pickUserImage();
                  },
                  child: const Text(
                    "Change Profile Photo",
                    style: TextStyle(color: Colors.blue),
                  )),
              ProfileField(
                label: "Name",
                controller: _nameController,
              ),
              ProfileField(
                label: "Username",
                controller: _usernameController,
              ),
              ProfileField(
                label: "Website",
                controller: _websiteController,
              ),
              ProfileField(
                label: "Bio",
                controller: _bioController,
              ),
              SizedBox(height: 15.h),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 260.w,
                  child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Switch to Professional Account",
                        style: TextStyle(color: Colors.blue, fontSize: 16.sp),
                      )),
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Private Information",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  )),
              ProfileField(
                label: "Email",
                controller: _emailController,
              ),
              ProfileField(
                label: "Phone",
                controller: _phoneController,
              ),
              ProfileField(
                label: "Gender",
                controller: _genderController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
