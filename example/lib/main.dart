//import 'package:blogger_api/api/blogger_api.dart';
import 'package:blogger_api/blogger_api.dart';
import 'package:example/consts.dart';
import 'package:example/pagesview.dart';
import 'package:example/postpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blogs Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Blogs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<BlogsModel>> getAllBlogs() async {
    final res = await BloggerAPI().getAllBlogs(apiKey: key, blogId: blogIds);

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder<List<BlogsModel>>(
        future: getAllBlogs(),
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
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(8.0),
                        width: 200,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                'Blog ${index + 1} - ${snapshot.data![index].name}'),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PostPage(
                                              blogId: blogIds[index],
                                              apiKey: key,
                                            )),
                                  );
                                },
                                icon: const Icon(Icons.post_add),
                                label: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Posts'),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PagesView(
                                              blogId: blogIds[index],
                                              apiKey: key,
                                            )),
                                  );
                                },
                                icon: const Icon(Icons.pages),
                                label: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Pages'),
                                ))
                          ],
                        ))),
                  );
                });
          }
        }),
      )),
    );
  }
}
