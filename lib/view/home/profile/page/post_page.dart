import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone_app/controller/home/home_cubit.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
      var cubit = HomeCubit.get(context);
    return BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is GetUserPostsLoadingState) {
                    return CircularProgressIndicator();
                  }
                  if (state is GetUserPostsFiledState) {
                    return Text('No posts found ${cubit.Posts.length}');
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cubit.Posts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 120 / 140),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(cubit.Posts[index]),
                                fit: BoxFit.cover)),
                      );
                    },
                  );
                },
              );
              }
}