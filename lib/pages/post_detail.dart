import 'package:flutter/material.dart';
import 'package:demo/modules/posts.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  PostDetail(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Post ${post.name}'),
        ),
        body: Center(
          child: Text(post.body),
        ));
  }
}
