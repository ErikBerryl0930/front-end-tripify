import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  final List<Category> dummyData = [
    Category(
      image:
          'https://images.unsplash.com/photo-1555899434-94d1368aa7af?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      title: 'Tim1',
      location: 'Jakarta',
      description: 'Description 1',
      rating: 4.5,
    ),
    Category(
      image:
          'https://images.unsplash.com/photo-1611638281871-1063d3e76e1f?q=80&w=2033&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      title: 'Tim2',
      location: 'Bandung',
      description: 'Description 2',
      rating: 3.8,
    ),
    Category(
      image:
          'https://images.unsplash.com/photo-1578469550956-0e16b69c6a3d?q=80&w=2006&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      title: 'Tim3',
      location: 'Yogyakarta',
      description: 'Description 2',
      rating: 3.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          return buildCategory(dummyData[index]);
        },
      )),
    );
  }

  Widget buildCategory(Category category) {
    return Card(
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(category.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category.title,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14,
                          ),
                          Text(category.rating.toString()),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        size: 12,
                      ),
                      Text(category.location),
                    ],
                  ),
                  Text(category.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String image;
  final String title;
  final String location;
  final String description;
  final double rating;

  Category({
    required this.image,
    required this.title,
    required this.location,
    required this.description,
    required this.rating,
  });
}
