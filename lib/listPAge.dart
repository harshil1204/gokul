import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gokul/config/config.dart';
import 'package:gokul/detailspage.dart';
import 'package:gokul/model/model.dart';
import 'package:gokul/resources/color.dart';
import 'package:gokul/service/firbaseservice.dart';

class ListWisePage extends StatefulWidget {
  String cat_id;
  String name;

  ListWisePage({Key? key, required this.cat_id, required this.name}) : super(key: key);

  @override
  State<ListWisePage> createState() => _ListWisePageState();
}

class _ListWisePageState extends State<ListWisePage> with SingleTickerProviderStateMixin {
  // final FirebaseService _firebaseService = FirebaseService();
  // List<Product> products=[];
  //  setProduct()async{
  //   products=await _firebaseService.getProductsByCategory(widget.cat_id);
  //   print(products![0].name.toString());
  // }
   TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  String name="";
  List search=[];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.name.toString(),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
              labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
              tabs:[
                Tab(text: "In Stock",),
                Tab(text: "Out Stock",),
              ]
          ),
          // actions: const [
          //   InkWell(
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 8.0),
          //       child: Icon(
          //         Icons.shopping_cart,
          //         size: 30,
          //       ),
          //     ),
          //   ),
          // ],
        ),
        body: TabBarView(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('Products')
                    .where('id', isEqualTo: widget.cat_id)
                    .where('inStock',isEqualTo: "true")
                    .orderBy("time ",descending: true)
                    // .limit(1)
                    .snapshots(),
                builder: (context,snapshot) {
                  if(snapshot.hasData){
                    return Stack(
                      children: [
                        Opacity(
                            opacity: MyConfig.opacity,
                            child: Image.asset(MyConfig.bg,fit: BoxFit.fill,height: double.infinity,width: double.infinity, )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Gap(5),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColor.grey,
                                      blurRadius: 0.5,
                                    )
                                  ]
                                ),
                                child:  Row(
                                  children: [
                                    const Icon(Icons.search,color: AppColor.primary),
                                    const Gap(7),
                                    Expanded(
                                      child: TextField(
                                        cursorHeight: 25,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Search"
                                        ),
                                        onChanged: (value) {
                                          if(value.isEmpty){
                                            FocusScope.of(context).unfocus();
                                          }
                                          setState(() {
                                            name=value;
                                            search=snapshot.data!.docs.where((element) => element['name'].toString().toLowerCase().startsWith(name.toLowerCase())).toList();
                                            print("heloooo ::::${search.toString()}");
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              if(search.isEmpty && name.isEmpty || name == "")
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.8,crossAxisCount: 2, crossAxisSpacing: 18, mainAxisSpacing: 14),
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
                                          decoration: BoxDecoration(
                                            /*border: Border.all(width: 1, color: Colors.black), */borderRadius: BorderRadius.circular(9)),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 170,
                                                  width: double.infinity,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20)
                                                  ),
                                                  child:CachedNetworkImage(imageUrl: data['url'],
                                                    fit: BoxFit.fill,
                                                    placeholder: (context, url) => Image.asset("assets/images/loading.png",width: double.infinity,
                                                      fit: BoxFit.fill,),
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
                                                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: Colors.black),
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
                              ),
                              if(search.isNotEmpty && name.isNotEmpty)
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.8,crossAxisCount: 2, crossAxisSpacing: 18, mainAxisSpacing: 14),
                                  itemCount: search.length,
                                  itemBuilder: (context, index) {
                                    var data = search[index];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailsPage(data: data),
                                            ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          /*border: Border.all(width: 1, color: Colors.black), */borderRadius: BorderRadius.circular(9)),
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 170,
                                                width: double.infinity,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                child:CachedNetworkImage(imageUrl: data['url'],
                                                  fit: BoxFit.fill,
                                                  placeholder: (context, url) => Image.asset("assets/images/loading.png",width: double.infinity,
                                                    fit: BoxFit.fill,),
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
                                                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: Colors.black),
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    );}
                  else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('Products')
                    .where('id', isEqualTo: widget.cat_id)
                    .where('inStock',isEqualTo: "false")
                    .orderBy("time ",descending: true)
                // .limit(1)
                    .snapshots(),
                builder: (context,snapshot) {
                  if(snapshot.hasData){
                    return Stack(
                      children: [
                        Opacity(
                            opacity: MyConfig.opacity,
                            child: Image.asset(MyConfig.bg,fit: BoxFit.fill,height: double.infinity,width: double.infinity, )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Gap(5),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                                decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppColor.grey,
                                        blurRadius: 0.5,
                                      )
                                    ]
                                ),
                                child:  Row(
                                  children: [
                                    const Icon(Icons.search,color: AppColor.primary),
                                    const Gap(7),
                                    Expanded(
                                      child: TextField(
                                        cursorHeight: 25,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Search"
                                        ),
                                        onChanged: (value) {
                                          if(value.isEmpty){
                                            FocusScope.of(context).unfocus();
                                          }
                                          setState(() {
                                            name=value;
                                            search=snapshot.data!.docs.where((element) => element['name'].toString().toLowerCase().startsWith(name.toLowerCase())).toList();
                                            print("heloooo ::::${search.toString()}");
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              if(search.isEmpty && name.isEmpty || name == "")
                                Expanded(
                                  child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.8,crossAxisCount: 2, crossAxisSpacing: 18, mainAxisSpacing: 14),
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
                                          decoration: BoxDecoration(
                                            /*border: Border.all(width: 1, color: Colors.black), */borderRadius: BorderRadius.circular(9)),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 170,
                                                  width: double.infinity,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20)
                                                  ),
                                                  child:CachedNetworkImage(imageUrl: data['url'],
                                                    fit: BoxFit.fill,
                                                    placeholder: (context, url) => Image.asset("assets/images/loading.png",width: double.infinity,
                                                      fit: BoxFit.fill,),
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
                                                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: Colors.black),
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
                                ),
                              if(search.isNotEmpty && name.isNotEmpty)
                                Expanded(
                                  child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.8,crossAxisCount: 2, crossAxisSpacing: 18, mainAxisSpacing: 14),
                                    itemCount: search.length,
                                    itemBuilder: (context, index) {
                                      var data = search[index];
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DetailsPage(data: data),
                                              ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            /*border: Border.all(width: 1, color: Colors.black), */borderRadius: BorderRadius.circular(9)),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 170,
                                                  width: double.infinity,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20)
                                                  ),
                                                  child:CachedNetworkImage(imageUrl: data['url'],
                                                    fit: BoxFit.fill,
                                                    placeholder: (context, url) => Image.asset("assets/images/loading.png",width: double.infinity,
                                                      fit: BoxFit.fill,),
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
                                                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: Colors.black),
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
                                ),
                            ],
                          ),
                        ),
                      ],
                    );}
                  else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }),
          ],
        )
      ),
    );
  }
}
