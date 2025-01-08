import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone_app/controller/auth/auth_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return Scaffold(
      body: Column(
        children: [
        //   BlocBuilder<AuthCubit, AuthState>(
        //     builder: (context, state) {
        //     if (state is PickImageLoadingState) {
        //       return CircularProgressIndicator();
        //     } else if (state is PickImageSuccessState) {
        //       return Image.file(cubit.imageFile!);
        //     } else {
        //       return Container(child: Text("والله مفيش صورة "),);
        //     }
        // }
        //   ),
             
        //   Center(
        //     child: TextButton(
        //         onPressed: cubit.pickUserImage, child: Text(" ...متجيب صورة")),
        //   ),
        //  Image.network(Supabase.instance.client.storage.from('user image').getPublicUrl('hU3y7kbwHfPCfAYA5pMQTLaXmx82/prfile/hU3y7kbwHfPCfAYA5pMQTLaXmx822025-01-08 03:25:25.016113').toString()),
          Text("Home Screen"),
          TextButton(
              onPressed: () {
                cubit.logOut();
              },
              child: Text("Log Out")),
        ],
      ),
    );
  }
}
