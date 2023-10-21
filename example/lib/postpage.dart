import 'package:blogger_api/blogger_api.dart';
import 'package:example/htmlview.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  final String blogId;
  final String apiKey;
  const PostPage({super.key, required this.blogId, required this.apiKey});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  BloggerAPI bloggerAPI =
      BloggerAPI(apiKey: widget.apiKey, blogId: widget.blogId);

  Future<PostModel> getAllpost() async {
    final res = await bloggerAPI.getAllPostFromBlog(
      includeComment: true,
    );
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: FutureBuilder(
          future: getAllpost(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Try Again'),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.items!.length,
                  itemBuilder: (ctx, index) {
                    return Center(
                      child: Card(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HTMLVIew(
                                      data: snapshot.data!.items![index],
                                    )),
                          );
                        },
                        child: Container(
                            height: 100,
                            width: double.infinity,
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child:
                                    Text(snapshot.data!.items![index].title!))),
                      )),
                    );
                  });
            }
          })),
    );
  }
}
