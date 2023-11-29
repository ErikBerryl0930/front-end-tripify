import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
   TransactionView({Key? key}) : super(key: key);
  final List<Transaction> dummyData = [
    Transaction(
      image:
          'https://images.unsplash.com/photo-1555899434-94d1368aa7af?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      title: 'Patung Pancoran',
      location: 'Jakarta',
      person: '3 Person',
      description: 'Rp 50.000',
      status: 'Payment Paid',
      date : '1 Mei 2024',
    ),
    Transaction(
      image:
          'https://images.unsplash.com/photo-1611638281871-1063d3e76e1f?q=80&w=2033&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      title: 'Kota Lama Bandung',
      location: 'Bandung',
      person: '3 Person',
      description: 'Rp 50.000',
      status: 'Payment Paid',
       date : '29 Juni 2023',
    ),
    Transaction(
      image:
          'https://images.unsplash.com/photo-1578469550956-0e16b69c6a3d?q=80&w=2006&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      title: 'Candi Prambanan',
      location: 'Yogyakarta',
      person: '3 Person',
      description: 'Rp 50.000',
      status: 'Payment Paid',
       date : '29 Juni 2023',
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('History Transaction'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          return buildTransaction(dummyData[index]);
        },
      )),
    );
  }

  Widget buildTransaction(Transaction transaction) {
    return Card(
      child: Container(
        height: 200,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(transaction.image),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        transaction.title,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.paid,
                            color: Colors.yellow,
                            size: 25,
                          ),
                          Text(transaction.status.toString()),
                          
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
                      Text(transaction.location),
                    ],
                  ),
                    Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 12,
                      ),
                      Text(transaction.person),
                    ],
                  ),
                    Row(
                    children: [
                      Icon(
                        Icons.money,
                        size: 12,
                      ),
                      Text(transaction.description),
                    ],
                  ),
                    Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12,
                      ),
                      Text(transaction.date),
                    ],
                  ),
                  
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Transaction {
  final String image;
  final String title;
  final String location;
  final String person;
  final String description;
  final String status;
   final String date;

  Transaction({
    required this.image,
    required this.title,
    required this.location,
    required this.person,
    required this.description,
    required this.status,
    required this.date,
  });
}

      
    
  

