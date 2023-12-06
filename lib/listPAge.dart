import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gokul/detailspage.dart';
import 'package:gokul/model/model.dart';
import 'package:gokul/service/firbaseservice.dart';

class ListWisePage extends StatefulWidget {
  String cat_id;
  String name;

  ListWisePage({Key? key, required this.cat_id, required this.name}) : super(key: key);

  @override
  State<ListWisePage> createState() => _ListWisePageState();
}

class _ListWisePageState extends State<ListWisePage> {
  // final FirebaseService _firebaseService = FirebaseService();
  // List<Product> products=[];
  //  setProduct()async{
  //   products=await _firebaseService.getProductsByCategory(widget.cat_id);
  //   print(products![0].name.toString());
  // }
  @override
  void initState() {
    //  setProduct();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.name.toString(),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('Products').where('id', isEqualTo: widget.cat_id).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print(snapshot.data!.docs);
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.9,crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 14),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data!.docs[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsPage(data: data),
                                      ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(/*border: Border.all(width: 1, color: Colors.black), */borderRadius: BorderRadius.circular(9)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: 150,
                                          child: Image.network(
                                            data['url'],
                                            fit: BoxFit.fill,
                                          )),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                          //color: Colors.grey,
                                              borderRadius: BorderRadius.circular(9)
                                          ),
                                          width: double.infinity,
                                          child: Center(
                                            child: Text(
                                              data['name'].toString() ?? '',
                                              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
