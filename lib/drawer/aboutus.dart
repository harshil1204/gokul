import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text("""
   
Gokul Jewellers has been serving its customers with exclusive Gold and Silver jewellery for 20 years as a Retailer. We present our customers with the most amazing designs that will not only satisfy you but truly will delight you. Whether you’re looking for an antique haram necklace or a modern peacock bracelet, you’ll find it here. Our jewellery designs include all types of gold items like necklaces, harams, bracelets, rings, chains, and much more. We also deliver amazing silver jewellery and accessories to our customers. If there’s something you’re looking for but not finding in our store, don’t worry, we specialise in getting order-based items to our customers as well. We have also been renowned for our gold jewellery designs which we deliver to our customers on the basis of their needs. In just a short time, we have carved a special niche in the jewellery industry by providing unique traditional and modern jewellery styles like bangles, bracelets, kadas, harams, payals, and much more. Delight us with your presence at our store and you will surely be amazed at the collection we have for you.
                  """,style: TextStyle(fontSize: 15),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
