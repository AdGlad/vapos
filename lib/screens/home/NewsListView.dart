import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class News {

  final String status;
  final int totalResults;
  final List<Article> articles;

  News({this.status, this.totalResults, this.articles});

  factory News.fromJson(Map<String, dynamic> json) {

    var list = json['articles'] as List;
    print(list.runtimeType);
    List<Article> articlesList = list.map((i) => Article.fromJson(i)).toList();

    return News(
      status:json['status'],
      totalResults:json['totalResults'],     
      articles:articlesList

    );
  }

}

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});
  
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author:json['author'],
      title:json['title'],
      description:json['description'],
      url:json['url'],
      urlToImage:json['urlToImage'],
      publishedAt:json['publishedAt'],
      content:json['content'],
    );
  }
}






class NewsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: _fetchNews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Article> data = snapshot.data;
          return _newsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<Article>> _fetchNews() async {

    final newsListAPIUrl = 'https://newsapi.org/v2/everything?q=vaping&apiKey=e902985b45cf4d72a4a2f8bb2dc2ae19';
    final response = await http.get(newsListAPIUrl);

    if (response.statusCode == 200) {
      Map jsonResponse = json.decode(response.body);
      News news = new News.fromJson(jsonResponse);
      return news.articles;
      //return jsonResponse.map((news) => new News().fromJson(news))
    } else {
      throw Exception('Failed to load news from API');
    }
  }

  ListView _newsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].author, data[index].title, Icons.work);
        });
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Text(title, 
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
        trailing: Icon(Icons.more_vert),
      );
}
