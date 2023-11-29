import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/flip_controller.dart';

class FlipView extends GetView<FlipController> {
  const FlipView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INVOICE'),
        centerTitle: true,
      ),
      body: Column(
        children:[
          Card (
            child: Row(
              children:[
            
                Container(
                  height:500,
                  width:500,
                  decoration:BoxDecoration(
                    color:Colors.amber,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children:[
                            Icon(Icons.star),
                          Text("Transaction Successfuly"),
                          Text("IDR 50.000"),
                          Row(
                            children: [
                              Text("------------------------------------------------"),
                              Text("Payment Details"),
                            ],
                          ), 
                        ]
                      ),
                       Icon(Icons.location_on),
                      Text("Payment Date"),
                      Text("28 October 2023 15:45:45"),
                      Text("Number Virtual Account"),
                      Text("994589349590530"),
                       Text("Name"),
                      Text("Mr Jhon Doer"),
                       Text("Name Of Tourist Attraction"),
                      Text("Candi ijo"),
                       Text("Quantyty Of Ticket"),
                      Text("3 Persons"),
                       Text("Number Of Reference Transaction"),
                      Text("INV/20230915/XXX/0123456789"),
                       Text("------------------------------------------------"),
                       Text("*)Show This Prof Of Payment As An E-ticket To In Tourist Atrractions"),
                    ],
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }
}
