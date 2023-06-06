import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iemmobile/services/apiservices.dart';

class ExampleRetrofit extends StatelessWidget {
  //const ExampleRetrofit({Key? key}) : super(key: key);
  final Dio dio = Dio();
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService(dio, baseUrl: baseUrl);
    return MaterialApp(
      title: 'API Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('API Demo'),
        ),
        body: FutureBuilder<List<Post>>(
          future: apiService.getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Post post = snapshot.data![index];
                  final cardId = index;
                  String cardDetails = post.body;
                  return GestureDetector(
                      onTap: () {
                        // Handle card tap
                        Post post = snapshot.data![index];
                        _handleCardTap(cardDetails);
                        // You can perform any actions or navigate to a new page with the card details
                      },
                      child: Card(
                          child: ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      )));
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

void _handleCardTap(String cardDetails) {
  // Handle card tap
  print('Card $cardDetails tapped!');
  // You can perform any actions or navigate to a new page with the card details
}
