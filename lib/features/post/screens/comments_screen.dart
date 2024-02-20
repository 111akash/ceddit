import 'package:ceddit/core/common/error_text.dart';
import 'package:ceddit/core/common/loader.dart';
import 'package:ceddit/core/common/post_card.dart';
import 'package:ceddit/features/post/controller/post_controller.dart';
import 'package:ceddit/features/post/widgets/comment_card.dart';
import 'package:ceddit/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentsScreen extends ConsumerStatefulWidget {
  final String postId;
  const CommentsScreen({
    super.key,
    required this.postId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends ConsumerState<CommentsScreen> {
  final commmentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    commmentController.dispose();
  }

  void addComment(Post post) {
    ref.read(postControllerProvider.notifier).addComment(
          context: context,
          text: commmentController.text.trim(),
          post: post,
        );

    setState(() {
      commmentController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(getPostByIdProvider(widget.postId)).when(
            data: (data) {
              return Column(
                children: [
                  PostCard(post: data),
                  const SizedBox(height: 10),
                  TextField(
                    onSubmitted: (val) => addComment(data),
                    controller: commmentController,
                    decoration: const InputDecoration(
                      hintText: 'What are your thoughts?',
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                  ref.watch(getPostCommentsProvider(widget.postId)).when(
                        data: (data) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                final comment = data[index];
                                return CommentCard(comment: comment);
                              },
                            ),
                          );
                        },
                        error: (error, stackTrace) {
                          return ErrorText(error: error.toString());
                        },
                        loading: () => const Loader(),
                      ),
                ],
              );
            },
            error: (error, stackTrace) => ErrorText(error: error.toString()),
            loading: () => const Loader(),
          ),
    );
  }
}