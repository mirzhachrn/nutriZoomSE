import 'package:bagianjosh/api_data/article/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleView extends StatelessWidget {
  final ArticleController _controller = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article List'),
      ),
      body: Obx(
        () => _controller.articles.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _controller.articles.length,
                itemBuilder: (context, index) {
                  var article = _controller.articles[index];
                  return ListTile(
                    leading: Image.network(
                      article.image,
                      width: 50, // Set the desired width of the image
                      height: 50, // Set the desired height of the image
                      fit: BoxFit
                          .cover, // Adjust the image to cover the entire space
                    ),
                    title: Text(article.author),
                    subtitle: Text(article.content),
                  );
                },
              ),
      ),
    );
  }
}
