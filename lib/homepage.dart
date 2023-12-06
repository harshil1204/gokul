/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gokul/add.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> getData() async {
    var data1 = (await FirebaseFirestore.instance.collection('data').get());
    List a=data1.docs.toList();
    print(a[0]['name']);
  }
  var data1 =  FirebaseFirestore.instance.collection('data');
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Xyz",style: TextStyle(color: Colors.white),),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddScreen(),));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.telegram,color: Colors.white,size: 30,),
            ),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: [
            Text("heloo")
          ],
        ),
      ),
*/
/*
      StreamBuilder<QuerySnapshot>(
          stream: data1.get().asStream(),
          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (!snapshot.hasData) {
              return const Text("Document does not exist");
            }

            //Data is output to the user
            if (snapshot.connectionState == ConnectionState.done) {
              print("connection ....");
              List data = snapshot.data!.docs.toList();
              return GridView.builder(
                itemCount: data.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 14),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){

                      },
                      child: Container(
                        // height: 130,
                       // margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Column(
                          children: [
                            SizedBox(height: 5,),
                            SizedBox(
                              height: 140,
                              child: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(data[index]['link'].toString(),fit: BoxFit.fill,)),
                            ),
                            const SizedBox(height: 7,),
                             Text(data[index]['name'].toString(),
                              maxLines: 2,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 15
                              ),),
                          ],
                        ),
                      ),
                    );
                  },
              );
            }

            return const Center(child: CircularProgressIndicator());
          },),
*//*

    );
  }
}
*/

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gokul/service/firbaseservice.dart';

import 'listPAge.dart';
import 'model/model.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Color> colors = [Colors.blue, Colors.red, Colors.pink, Colors.orange];
  final random=Random();
   var banner1;
  final FirebaseService _firebaseService = FirebaseService();
  // List<Category> category=[];
  //
  // void setCategory()async{
  //   category=await _firebaseService.getAllCategories() as List<Category>;
  //   print(category![0].name.toString());
  // }
 @override
  void initState() {
    banner1=_firebaseService.fetchDataFromFirestore();
    print("lenght::::::${banner1}");
   // Category newCategory = Category(id: 'category_2', name: 'Rings');
   // _firebaseService.addCategory(newCategory);
   //
   // Product newProduct = Product(id: 'product_2', name: 'rouded', categoryID: 'category_2');
   // _firebaseService.addProduct(newProduct);
    // print(category.length);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: const Text("Gokul Jewellers",
            style: TextStyle(fontSize: 20)),
        actions: const [
          InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.shopping_cart,size: 30,),
            ),
          ),
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('Categories').get(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 /* Padding(
                    padding: const EdgeInsets.only(bottom: 0, left: 5, right: 5),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          aspectRatio: 16 / 5,
                          enableInfiniteScroll: true,
                          viewportFraction: 1,
                          enlargeCenterPage: false,
                          reverse: false,
                          autoPlay: true,
                          scrollPhysics: const NeverScrollableScrollPhysics(),
                          autoPlayInterval: const Duration(seconds: 4),
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        ),
                        items: [
                          // Image.network(banner1.toString(),fit: BoxFit.fill,),

                        ],
                      ),
                    ),
                  ),*/
                  const SizedBox(height: 7,),
                  const Text("Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 7,),
                  Expanded(
                    child: ListView.builder(
                      itemCount:snapshot.data!.docs.length ?? 0,
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()
                      ),
                      itemBuilder:(context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListWisePage(cat_id: snapshot.data!.docs[index].id.toString(),name: snapshot.data!.docs[index]['name']),));
                            },
                            child: Card(
                              elevation: 5,
                              color: colors[random.nextInt(4)].withOpacity(0.4),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child:  SizedBox(
                                height: 100,width: double.infinity,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(snapshot.data!.docs![index]['name'].toString() ?? " ",maxLines: 1,style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }

        }
      )
    );
  }
}
