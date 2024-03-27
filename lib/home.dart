import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'news_content.dart';
import 'news_model.dart';

class HomePage extends StatelessWidget {
  final List<Widget> imageSliders = [
    Image.asset('assets/trump.png', fit: BoxFit.cover),
    Image.asset('assets/books.jpg', fit: BoxFit.cover),
    Image.asset('assets/atif.jpg', fit: BoxFit.cover),
    // Add more images as needed
  ];

  final List<String> imageTexts = [
    'US: Trump,Biden win respective primaries in Louisiana, gear up for rematch',
    'New Curriculum, Books for Grades 3 and 6 from 2024-25, No Change for other Classes: CBSE',
    'Atif Aslam FINALLY Reveals Daughter Haleemas Face On Her First Birthday, Photos Go Viral',
    // Add corresponding text for each image
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Column(
        children: [
          // Banner Carousel
          Container(
            height: 200, // Adjust height as needed
            child: CarouselSlider.builder(
              itemCount: imageSliders.length,
              options: CarouselOptions(
                aspectRatio: 15 / 9,
                viewportFraction: 0.8,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              itemBuilder: (BuildContext context, int index, _) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    imageSliders[index],
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        imageTexts[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 20), // Adjust spacing as needed
          // Newscards
          Expanded(
            child: ListView.builder(
              itemCount: newsModel.length,
              itemBuilder: (context, index) {
                final news = newsModel[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailsPage(news: news),
                            ),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(news.imageUrl),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   animal.name,
                                  //   style: TextStyle(
                                  //       fontSize: 18,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  Text(
                                    news.shortDescription,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  NewsDetailsPage(news: news),
                                            ),
                                          );
                                        },
                                        child: Text('Read More'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(), // Add a divider between each animal
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class AnimalDetailsPage extends StatelessWidget {
//   final Animal animal;

//   AnimalDetailsPage({required this.animal});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Animal Details'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.network(
//               animal.imageUrl,
//               height: 200,
//               width: 200,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             animal.description,
//             style: TextStyle(fontSize: 18),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NewsCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'News Title', // Replace with actual news title
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'News Summary', // Replace with actual news summary
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }
