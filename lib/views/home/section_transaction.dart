import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../functions/function_get.dart';
import '../../functions/token_manager.dart';
import '../../model/transaction.dart';

class SectionTransaction extends StatefulWidget {
  const SectionTransaction({super.key});

  @override
  State<SectionTransaction> createState() => _SectionTransactionState();
}

List<Transaction> transactions = [];

class _SectionTransactionState extends State<SectionTransaction> {
  @override
  void initState() {
    super.initState();
    fetchTransaction();
  }

  Future<void> fetchTransaction() async {
    try {
      String? token = await TokenManager.getToken();
      List<Transaction> fetchedTransactions = await getTransactions(token);
      setState(() {
        transactions = fetchedTransactions;
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction',
          style: GoogleFonts.poppins(
              fontSize: 30 * width / 720,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListView.builder(
            // padding: const EdgeInsets.symmetric(horizontal: 30),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              if (transactions.isEmpty) {
                return Column(
                  children: [
                    SizedBox(
                      height: 0.55 * height,
                      child: Image.asset('assets/images/no_transaction.jpg',
                          fit: BoxFit.cover),
                    ),
                    Text(
                      'You have no transactions',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700, color: Colors.grey),
                    ),
                  ],
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // _navigateToDetails(destinations[index].id);
                        },
                        child: Card(
                          elevation: 5,
                          margin: const EdgeInsets.all(5.0),
                          child: ListTile(
                            title: Text(
                              transactions[index].invoiceNumber,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Row(
                                //   children: [
                                //     const Icon(
                                //       Icons.location_on,
                                //       color: Colors.grey,
                                //     ),
                                //     Text(filteredDestinations[index].region,
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.w400,
                                //             color: Colors.grey)),
                                //   ],
                                // ),
                                // Text(filteredDestinations[index].description,
                                //     overflow: TextOverflow.ellipsis,
                                //     style: const TextStyle(
                                //         fontWeight: FontWeight.w400,
                                //         color: Colors.black)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
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
