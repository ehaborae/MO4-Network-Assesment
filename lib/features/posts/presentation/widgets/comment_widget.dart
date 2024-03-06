import 'package:flutter/material.dart';

import '../../domain/entity/comment.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: double.infinity,
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
                Text(comment.name),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              comment.body,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
