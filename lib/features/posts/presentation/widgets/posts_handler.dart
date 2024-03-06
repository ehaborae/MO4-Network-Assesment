import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/features/posts/presentation/widgets/post_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/enums.dart';
import '../providers/movie_provider.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<PostsProvider>();

    CallStatus callStatus = watcher.callStatus;

    switch (callStatus) {
      case CallStatus.loaded:
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => PostWidget(
              post: watcher.posts![index],
            ),
            itemCount: watcher.posts!.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ),
        );
      case CallStatus.error:
        return Center(
          child: Text(watcher.message ?? ''),
        );
      default:
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.separated(
              itemBuilder: (context, index) => Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    color: Colors.grey,
                  ),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 10)),
        );
    }
  }
}
