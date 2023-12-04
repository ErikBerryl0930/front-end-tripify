import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripify_app/functions/api_url.dart';

import '../../functions/function_get.dart';
import '../../model/destination.dart';
import '../detail/detail_screen.dart';

class SectionDestination extends StatefulWidget {
  const SectionDestination({super.key});

  @override
  State<SectionDestination> createState() => _SectionDestinationState();
}

List<Destination> destinations = [];
List<Destination> filteredDestinations = [];

class _SectionDestinationState extends State<SectionDestination> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDestination();
  }

  Future<void> fetchDestination() async {
    try {
      List<Destination> fetchedDestinations = await getDestinations();
      setState(() {
        destinations = fetchedDestinations;
        filteredDestinations = destinations;
      });
    } catch (e) {
      print('Error fetching categories: $e');
      // Handle the error, show a message to the user, etc.
    }
  }

  void filterDestinations(String query) {
    List<Destination> filteredList = destinations.where((destination) {
      return destination.destinationName
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredDestinations = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: null,
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) {
              filterDestinations(
                  value); // Memanggil fungsi filter saat nilai berubah
            },
          ),
          ListView.builder(
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredDestinations.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailScreen(),
                    ),
                  );
                },
                child: Column(children: [
                  Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Container(
                      height: 0.13 * height,
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 12),
                            height: 0.1 * height,
                            width: 200 * width / 720,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(ApiUrl.imageURL +
                                    destinations[index].picture.split('/').last),
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
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(destinations[index].destinationName,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    // untuk rating
                                    // Row(
                                    //   children: [
                                    //     const Icon(
                                    //       Icons.star,
                                    //       color: Colors.yellow,
                                    //       size: 14,
                                    //     ),
                                    //     Text(destinations[index].destinationName,
                                    //         style: GoogleFonts.poppins(
                                    //             fontWeight: FontWeight.bold,
                                    //             color: Colors.black)),
                                    //   ],
                                    // ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                    ),
                                    Text(destinations[index].region,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey)),
                                  ],
                                ),
                                Text(destinations[index].description,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              );
            },
          ),
        ]
            .map((widget) => Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20.0, left: 15.0, right: 15.0),
                  child: widget,
                ))
            .toList(),
      )),
    );
  }
}
