import 'package:flutter/material.dart';

import 'news_model.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsModel news;

  NewsDetailsPage({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                news.imageUrl,
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black), // Style for the entire text
                  children: <TextSpan>[
                    TextSpan(
                      text: news.description.split(' ').first, // First word
                      style: TextStyle(
                        fontSize: 35,
                      ), // Style for the first word
                    ),
                    TextSpan(
                      text: ' ', // Add space after the first word
                    ),
                    TextSpan(
                      text: news.description
                          .split(' ')
                          .skip(1)
                          .join(' '), // Remaining words
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
