import 'package:biofresh/common/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:biofresh/providers/resources/provider.dart';
import 'package:biofresh/models/postModel.dart';
import 'package:biofresh/providers/ui/dataProvider.dart';
import 'package:biofresh/uicontainers/Home/helpers.dart';

class Home extends StatefulWidget {
  @override
  _MyPostsScreenState createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends State<Home> {
  @override
  void initState() {
    super.initState();
    calculate(context);
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    postProvider.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final mainDataProvider = Provider.of<PostProvider>(context);
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: FutureBuilder<List<Post>>(
        future: mainDataProvider.posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].body),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataProvider.updateData('I am changed');
          mainDataProvider.refetchPosts();
          Navigator.pushNamed(context, '/login');
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
