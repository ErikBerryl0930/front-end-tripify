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
        backgroundColor: const Color(0xFF004C5C).withOpacity(0.5),
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
          // Text(
          //   'Transaction History',
          //   style: GoogleFonts.poppins(
          //       fontSize: 35 * width / 720,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.black),
          // ),
          ListView.builder(
            // padding: const EdgeInsets.symmetric(horizontal: 30),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.isNotEmpty ? transactions.length : 1,
            itemBuilder: (context, index) {
              if (transactions.isNotEmpty) {
                return Card(
                  child: Container(
                    height: 200,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        // Container(
                        //   margin: const EdgeInsets.only(right: 12),
                        //   height: 100,
                        //   width: 100,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(12),
                        //     image: const DecorationImage(
                        //       image: NetworkImage(
                        //           'https://images.unsplash.com/photo-1578469550956-0e16b69c6a3d?q=80&w=2006&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(transactions[index].invoiceNumber,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  const Row(
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
                              const Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    size: 12,
                                  ),
                                  Text('transaction.location'),
                                ],
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 12,
                                  ),
                                  Text('transaction.person'),
                                ],
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.money,
                                    size: 12,
                                  ),
                                  Text('transaction.description'),
                                ],
                              ),
                              const Row(
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
              } else {
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
