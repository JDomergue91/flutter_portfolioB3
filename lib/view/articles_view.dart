import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticlesView extends StatefulWidget {
  const ArticlesView({super.key});

  @override
  ArticlesViewState createState() => ArticlesViewState();
}

class ArticlesViewState extends State<ArticlesView> {
  final List<dynamic> _articles = [];
  int _currentPage = 1;
  final int _articlesPerPage = 10;
  bool _isLoading = false;
  bool _hasMoreArticles = true;
  final int _totalArticles = 100;

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  Future<void> _fetchArticles() async {
    if (_isLoading || !_hasMoreArticles) return;

    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_page=$_currentPage&_limit=$_articlesPerPage'));

    if (response.statusCode == 200) {
      final List<dynamic> fetchedArticles = json.decode(response.body);
      setState(() {
        _isLoading = false;
        _hasMoreArticles = fetchedArticles.length == _articlesPerPage;
        _articles.clear();
        _articles.addAll(fetchedArticles);
      });
    } else {
      throw Exception('Failed to load articles');
    }
  }

  void _goToPage(int page) {
    setState(() {
      _currentPage = page;
      _fetchArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPages = (_totalArticles / _articlesPerPage).ceil();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _articles.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _articles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_articles[index]['title']),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticleDetailView(article: _articles[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
          // Pagination
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalPages, (index) {
              int pageNumber = index + 1;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ElevatedButton(
                  onPressed: () => _goToPage(pageNumber),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentPage == pageNumber ? Colors.blue : Colors.grey,
                  ),
                  child: Text(pageNumber.toString()),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class ArticleDetailView extends StatelessWidget {
  final dynamic article;

  const ArticleDetailView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(article['body']),
      ),
    );
  }
} 