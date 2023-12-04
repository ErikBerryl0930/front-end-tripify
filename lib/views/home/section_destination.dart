import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../functions/api_url.dart';
import '../../functions/function_get.dart';
import '../../functions/navigation_services.dart';
import '../../model/destination.dart';
import '../detail/detail_screen.dart';

class SectionDestination extends StatefulWidget {
  const SectionDestination({super.key});

  @override
  State<SectionDestination> createState() => _SectionDestinationState();
}

class _SectionDestinationState extends State<SectionDestination> {
  List<Destination> destinations = [];
  List<Destination> filteredDestinations = [];
  Destination? _destination;
  bool isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    try {
      List<Destination> fetchedDestinations = await getDestinations();
      setState(() {
        destinations = fetchedDestinations;
        filteredDestinations =
            destinations; // Inisialisasi filteredDestinations dengan seluruh data destinasi
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching destinations: $e');
      setState(() {
        isLoading = false;
      });
      // Handle the error
    }
  }

  void searchDestinations(String query) {
    List<Destination> filteredList = destinations.where((destination) {
      return destination.destinationName
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredDestinations = filteredList;
    });
  }

  void _navigateToDetails(int destinationId) async {
    // Fetch destination details using the API function
    http.Response response = await getDestinationInfo(destinationId);

    final dest = Destination.fromJson(json.decode(response.body));
    _destination = dest;

    NavigationServices.push(DetailScreen(destination: _destination));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Destination',
          style: GoogleFonts.poppins(
              fontSize: 30 * width / 720,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        actions: [
          SizedBox(
            width: 0.5 * width,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  searchDestinations(value);
                },
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: filteredDestinations.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _navigateToDetails(destinations[index].id);
                    },
                    child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(5.0),
                      child: ListTile(
                        leading: Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 0.1 * height,
                          width: 180 * width / 720,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(ApiUrl.imageURL +
                                  destinations[index].picture.split('/').last),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          filteredDestinations[index].destinationName,
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                ),
                                Text(filteredDestinations[index].region,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey)),
                              ],
                            ),
                            Text(filteredDestinations[index].description,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
