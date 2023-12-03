import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHome extends StatefulWidget {
  const SectionHome({super.key});

  @override
  State<SectionHome> createState() => _SectionHomeState();
}

class _SectionHomeState extends State<SectionHome> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                    'Hi, Username!',
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
                  itemCount: 10, // Ganti dengan jumlah item dalam ListView
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
                            'Item $index',
                            style: const TextStyle(color: Colors.white),
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
                  itemCount: 20, // Ganti dengan jumlah item dalam GridView
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 8,
                      child: Container(
                        color: Colors
                            .white, // Ganti dengan warna atau widget yang sesuai
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              'https://images.unsplash.com/photo-1555899434-94d1368aa7af?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Ganti dengan URL gambar yang diinginkan
                              // width: 100, // Lebar gambar
                              height: 100, // Tinggi gambar
                              fit: BoxFit.cover, // Atur metode tampilan gambar
                            ),
                            // const SizedBox(
                            //     height: 8), // Spasi antara gambar dan teks
                            Row(
                              children: [
                                Text(
                                  'Nama $index',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.grey,
                              ),
                              Text(
                                'Lokasi $index',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ]),
                          ],
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
