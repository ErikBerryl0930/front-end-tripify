import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../functions/function_get.dart';
import '../../model/destination.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, this.destination});
  final Destination? destination;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

List<Destination> destinations = [];

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    // fetchDestinationInfo();
  }

  // Future<void> fetchDestinationInfo() async {
  //   try {
  //     List<Destination> fetchedDestinationInfo = await getDestinationInfo();
  //     setState(() {
  //       destinations = fetchedDestinationInfo;
  //     });
  //   } catch (e) {
  //     print('Error fetching categories: $e');
  //     // Handle the error, show a message to the user, etc.
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Destination? destination = widget.destination;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.network(
              'https://images.pexels.com/photos/2609952/pexels-photo-2609952.jpeg?auto=compress&cs=tinysrgb&w=600',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: height * 0.65,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${destination?.destinationName}',
                      style: GoogleFonts.poppins(
                        fontSize: 38 * width / 720,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        Text(
                          '${destination?.region}',
                          style: GoogleFonts.poppins(
                            fontSize: 25 * width / 720,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${destination?.description}',
                      style: GoogleFonts.poppins(
                        fontSize: 25 * width / 720,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${destination?.transportRecomendation}',
                      style: GoogleFonts.poppins(
                        fontSize: 25 * width / 720,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ]
                      .map((widget) => Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 20.0, right: 20.0),
                            child: widget,
                          ))
                      .toList()),
            ),
          ),
        ],
      ),
    );
  }
}
