import 'package:demo/modules/my_list.dart';
import 'package:demo/modules/posts.dart';
import 'package:demo/modules/service.dart';
import 'package:demo/pages/post_detail.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Post> _posts;
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _posts = <Post>[];
    Service.getPosts().then((posts) {
      setState(() {
        _posts = posts;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyList(loading: _loading, posts: _posts);
  }
}
