import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tripify_app/functions/function_get.dart';
import 'package:tripify_app/provider/user_provider.dart';
import 'package:tripify_app/model/user.dart';
import 'package:tripify_app/model/category.dart';

import '../../functions/api_url.dart';
import '../../model/destination.dart';
import '../detail/detail_screen.dart';

class SectionHome extends StatefulWidget {
  const SectionHome({super.key});

  @override
  State<SectionHome> createState() => _SectionHomeState();
}

List<Category> categories = [];
List<Destination> destinations = [];

class _SectionHomeState extends State<SectionHome> {
  @override
  void initState() {
    super.initState();
    fetchData();
    fetchDestination();
  }

  Future<void> fetchData() async {
    try {
      List<Category> fetchedCategories = await getCategories();
      setState(() {
        categories = fetchedCategories;
      });
    } catch (e) {
      print('Error fetching categories: $e');
      // Handle the error, show a message to the user, etc.
    }
  }

  Future<void> fetchDestination() async {
    try {
      List<Destination> fetchedDestinations = await getDestinations();
      setState(() {
        destinations = fetchedDestinations;
      });
    } catch (e) {
      print('Error fetching categories: $e');
      // Handle the error, show a message to the user, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    UserProvider userProvider = Provider.of<UserProvider>(context);
    User? user = userProvider.user;

    return Scaffold(
        appBar: null,
        body: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Hi, ${user?.username}',
                    style: GoogleFonts.poppins(
                        fontSize: 35 * width / 720,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.08,
                    backgroundImage: const NetworkImage(
                        'https://via.placeholder.com/73x73'), // replace with your image url
                  ),
                ],
              ),
              Text(
                'Category',
                style: GoogleFonts.poppins(
                    fontSize: 25 * width / 720,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              SizedBox(
                height: 0.05 * height, // Tinggi dari ListView horizontal
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories
                      .length, // Ganti dengan jumlah item dalam ListView
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 0.1 *
                            width, // Lebar dari setiap item dalam ListView
                        decoration: BoxDecoration(
                          color: Colors
                              .green, // Ganti dengan warna atau widget yang sesuai
                          borderRadius: BorderRadius.circular(
                              50.0), // Mengatur sudut menjadi bulat
                        ),
                        child: Center(
                          child: Text(
                            categories[index].categoryName,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                'Recommendation',
                style: GoogleFonts.poppins(
                    fontSize: 25 * width / 720,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              SizedBox(
                height: 0.4 * height,
                width: 600 * width / 720, // Tinggi dari GridView horizontal
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Jumlah kolom dalam GridView
                  ),
                  itemCount: destinations
                      .length, // Ganti dengan jumlah item dalam GridView
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailScreen(),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 8,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.network(
                                ApiUrl.imageURL +
                                    destinations[index].picture.split('/').last,
                                width: double.infinity, // Lebar gambar
                                height: 0.12 * height, // Tinggi gambar
                                fit:
                                    BoxFit.cover, // A2ur metode tampilan gambar
                              ),
                              // const SizedBox(
                              //     height: 8), // Spasi antara gambar dan teks
                              Row(
                                children: [
                                  Text(
                                    destinations[index].destinationName,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ]
                                    .map((widget) => Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, right: 5.0),
                                          child: widget,
                                        ))
                                    .toList(),
                              ),
                              Row(children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                ),
                                Text(
                                  destinations[index].region,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]
                .map((widget) => Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: widget,
                    ))
                .toList(),
          ),
        ));
  }
}
