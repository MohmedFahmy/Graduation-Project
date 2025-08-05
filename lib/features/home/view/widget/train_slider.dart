import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrainSlider extends StatelessWidget {
  final List<Map<String, dynamic>> trains = [
    {
      'image': 'images/first_class.jpg',
      'title': 'First Class',
      'description':
          'Spacious seats, air-conditioned, 10% discount available, Sleeping cabins'
    },
    {
      'image': 'images/second_class.jpg',
      'title': 'Second Class',
      'description': 'Comfortable ride with affordable price, Fast train'
    },
    {
      'image': 'images/economy.jpg',
      'title': 'Economy',
      'description': 'Economical option with basic facilities, Cheap price'
    },
    {
      'image': 'images/kargo.jpg',
      'title': 'Cargo train',
      'description': 'Cargo train for transporting goods, Fast and reliable'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 420.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        enlargeCenterPage: true,
        viewportFraction: 0.70,
      ),
      items: trains.map((train) {
        return Builder(
          builder: (BuildContext context) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          train['image'],
                          fit: BoxFit.cover,
                          height: constraints.maxHeight * 0.65, // يساوي ~230
                          width: double.infinity,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                train['title'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[800],
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                train['description'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      }).toList(),
    );
  }
}
