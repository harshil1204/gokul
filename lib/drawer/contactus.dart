import 'package:flutter/material.dart';
import 'package:gokul/resources/color.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
        child: Card(
          elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          child: Container(
            height: 380,
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
            child: const Column(
              children: [
                SizedBox(height: 5),
                Row(
                  children: [
                    Text("Address  :  ", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    Flexible(child: Text("Amarpara, ST Road, Bagasara, Amreli, Gujarat 365440, India", style: TextStyle(fontSize: 16,))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                  child: Divider(height: 1,thickness: 0.4,color: AppColor.dividerColor),
                ),

                Row(
                  children: [
                    Text("WhatsApp Number  :  ", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    Flexible(child: Text("+91 9408851222", style: TextStyle(fontSize: 16,))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                  child: Divider(height: 1,thickness: 0.4,color: AppColor.dividerColor),
                ),
                Row(
                  children: [
                    Text("WhatsApp Number  :  ", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    Flexible(child: Text("+91 9328073330", style: TextStyle(fontSize: 16,))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                  child: Divider(height: 1,thickness: 0.4,color: AppColor.dividerColor),
                ),
                Row(
                  children: [
                    Text("Email  :  ", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    Flexible(child: Text("gokuljewellers22@gmail.com", style: TextStyle(fontSize: 16,))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                  child: Divider(height: 1,thickness: 0.4,color: AppColor.dividerColor),
                ),
                Row(
                  children: [
                    Text("GST Number  :  ", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    Flexible(child: Text("24AOGPK2175L1ZT", style: TextStyle(fontSize: 16))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                  child: Divider(height: 1,thickness: 0.4,color: AppColor.dividerColor),
                ),
                Row(
                  children: [
                    Text("Hours  :  ", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    Flexible(child: Text("9:30 am - 7:30 pm", style: TextStyle(fontSize: 16,))),
                  ],
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                //   child: Divider(height: 1,thickness: 0.4,color: AppColor.dividerColor),
                // ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
