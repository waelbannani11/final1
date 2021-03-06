import 'package:final1/widgets/back_button.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';

import 'create_new_rdv_page.dart';


class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class Search extends StatelessWidget {
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    if (search == "empty") return [];
    if (search == "error") throw Error();
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar<Post>(
              onSearch: search,
              onItemFound: (Post post, int index) {
                return GestureDetector(
                  
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateNewTaskPage(),
                              settings: RouteSettings(
                                arguments: post
                              )
                            ),
                          );
                        },                    
                      child: ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.description),
                      ),
                    );
              },
            )),
      ),
    );
  }
}
