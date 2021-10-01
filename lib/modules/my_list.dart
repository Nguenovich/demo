import 'package:demo/modules/on_hover.dart';
import 'package:demo/modules/posts.dart';
import 'package:demo/pages/post_detail.dart';
import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  const MyList({
    Key? key,
    required bool loading,
    required List<Post> posts,
  })  : _loading = loading,
        _posts = posts,
        super(key: key);

  final bool _loading;
  final List<Post> _posts;

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
              return OnHover(builder: (isHovered) {
                final mycolor = isHovered ? Colors.amber[100] : Colors.blue;
                return Container(
                  decoration: BoxDecoration(
                    color: mycolor,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  margin: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(post.name),
                    subtitle: Text(post.email),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostDetail(post)));
                    },
                  ),
                );
              });
            }),
      ),
    );
  }
}
