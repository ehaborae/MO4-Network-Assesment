import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:provider_demo/features/posts/domain/entity/comment.dart';
import 'package:provider_demo/features/posts/presentation/widgets/comment_widget.dart';
import '/features/posts/domain/entity/post.dart';

class PostDetailsScreen extends StatelessWidget {
  final Post post;
  final String image;

  const PostDetailsScreen({
    super.key,
    required this.post,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: const Text('Post Details'),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 16,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image(
                image: NetworkImage(image),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            AnimatedReadMoreText(
              animationCurve: Curves.easeInOutCubic,
              post.body,
              maxLines: 2,
              readMoreText: '..Expand',
              readLessText: '..Collapse',
              textStyle: Theme.of(context).textTheme.bodyMedium,
              buttonTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.blue[800],
                  ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => const CommentWidget(
                  comment: Comment(
                    postId: 2,
                    id: 1,
                    name: 'ghj',
                    email: 'email',
                    body: 'body',
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
