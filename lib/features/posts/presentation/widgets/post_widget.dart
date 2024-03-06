import 'dart:math';

import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/mock_data/mock_network_images.dart';
import '../../domain/entity/post.dart';
import '../screens/post_details_screen.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final imageIndex = random.nextInt(10);
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: NetworkImage(mockNetworkImages[imageIndex]),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Container(
            margin: const EdgeInsetsDirectional.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: double.infinity,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => PostDetailsScreen(
                        post: post,
                        image: mockNetworkImages[imageIndex],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsQ5vsvCrmS3g8GGM82P6I2wyPwVOhxYtPqA&usqp=CAU',
                            ),
                            radius: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(post.userId.toString()),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        post.title,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AnimatedReadMoreText(
                        post.body,
                        maxLines: 2,
                        readMoreText: '..Expand',
                        readLessText: '..Collapse',
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        buttonTextStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.blue[800],
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
