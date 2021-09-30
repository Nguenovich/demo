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
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Posts'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              Post post = _posts[index];
              return ListTile(
                title: Text(post.name),
                subtitle: Text(post.email),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostDetail(post)));
                },
              );
            }),
      ),
    );
  }
}



//                   onTap: () {
// Navigator.push(context, route)
//                   },