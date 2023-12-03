import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripify_app/functions/api_url.dart';

import '../../functions/function_get.dart';
import '../../model/destination.dart';

class SectionDestination extends StatefulWidget {
  const SectionDestination({super.key});

  @override
  State<SectionDestination> createState() => _SectionDestinationState();
}

List<Destination> destinations = [];

class _SectionDestinationState extends State<SectionDestination> {
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
    return Scaffold(
      appBar: null,
      body: SafeArea(
          child: Column(
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
          ListView.builder(
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              return Column(children: [
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
                              image: NetworkImage(
                                ApiUrl.imageURL + destinations[index].picture.split('/').last),
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
              ]);
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
