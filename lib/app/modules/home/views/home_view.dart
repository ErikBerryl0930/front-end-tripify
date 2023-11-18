import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> dest = [
      'padimas',
      'bambang',
      'makaroni',
      'hewes',
      'konst',
      'naspad',
      'nasgor',
      'item',
      'tembem',
      'berbuli',
      'apatuch',
      'kok becek',
    ];

    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    'Hi, Username',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  child: CircleAvatar(),
                ),
              ],
            ),
            Container(
              child: TextField(
                controller: controller.searchController,
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  labelText: 'Search here',
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                child: Row(
                  children: List.generate(
                    10,
                    (index) {
                      var item = {};
                      bool selected = index == 0;

                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          color: selected ? Colors.amber : Colors.grey,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Menu ${index + 1}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: (dest.length / 2).ceil(),
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  int startIndex = index * 2;
                  int endIndex = (index + 1) * 2;
                  endIndex > dest.length ? dest.length : endIndex;
                  return Row(
                      children: List.generate(endIndex - startIndex, (indexOf) {
                    int current = startIndex + indexOf;
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: desCard(dest[current]),
                      ),
                    );
                  }));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget desCard(String dest) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              dest,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Add other details or widgets related to the fruit
          ],
        ),
      ),
    );
  }
}
