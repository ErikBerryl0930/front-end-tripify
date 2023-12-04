import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTransaction extends StatefulWidget {
  const SectionTransaction({super.key});

  @override
  State<SectionTransaction> createState() => _SectionTransactionState();
}

class _SectionTransactionState extends State<SectionTransaction> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: null,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Transaction History',
            style: GoogleFonts.poppins(
                fontSize: 35 * width / 720,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          ListView.builder(
            // padding: const EdgeInsets.symmetric(horizontal: 30),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  height: 200,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1578469550956-0e16b69c6a3d?q=80&w=2006&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
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
                                  'transaction.title',
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.paid,
                                      color: Colors.yellow,
                                      size: 25,
                                    ),
                                    // Text('transaction.status.toString()'),
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
                                Text('transaction.location'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 12,
                                ),
                                Text('transaction.person'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.money,
                                  size: 12,
                                ),
                                Text('transaction.description'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 12,
                                ),
                                Text('transaction.date'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
