import 'package:flutter/material.dart';

class SectionDestination extends StatefulWidget {
  const SectionDestination({super.key});

  @override
  State<SectionDestination> createState() => _SectionDestinationState();
}

class _SectionDestinationState extends State<SectionDestination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
          child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  // Lakukan sesuatu dengan nilai yang diubah
                  // Misalnya, filter hasil pencarian
                },
              ),
              Card(
                color: Colors.white,
                elevation: 5,
                child: Container(
                  height: 100,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1555899434-94d1368aa7af?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'category.title',
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 14,
                                    ),
                                    Text('category.rating'),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 12,
                                ),
                                Text('category.location'),
                              ],
                            ),
                            Text('category.description'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]
                .map((widget) => Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: widget,
                    ))
                .toList(),
          );
        },
      )),
    );
  }
}
