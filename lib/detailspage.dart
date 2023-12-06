import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DetailsPage extends StatefulWidget {
  var data;
   DetailsPage({Key? key,required this.data}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool zoom=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.data['name'].toString(),style: const TextStyle(
          fontSize: 22,fontWeight: FontWeight.bold,
        ),),
        actions: const [
          InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.share,size: 25,),
            ),
          ),
        ],
      ),
      body: zoom==false?SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             InkWell(
               onTap: (){
                 setState(() {
                   zoom=true;
                 });
               },
               child: Container(
                  clipBehavior: Clip.hardEdge,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(30),
                   border: Border.all(color: Colors.grey,width: 2)
                 ),
                 width: double.infinity,
                 //height: 500,
                 child: ClipRRect(
                     borderRadius: BorderRadius.circular(30),
                 child: Image.network(widget.data['url'].toString(),fit: BoxFit.fill)),
               ),
             ),
             /* InteractiveViewer(
                panEnabled: true, // Set it to false
                boundaryMargin: const EdgeInsets.all(100),
                minScale: 0.5,
                maxScale: 2,
                scaleEnabled: true,
                child: Image.network(
                  widget.data['url'].toString(),
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.fill,
                ),
              ),*/
              // const Divider(thickness: 0.9,height: 2,),
              Container(
                //height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //color: Colors.grey,
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Wrap(
                         children: [
                           const Text("N : ",style: TextStyle(
                             //color: Colors.white,
                               fontSize: 16,
                               fontWeight: FontWeight.w600
                           ),),
                           Text("${widget.data['name']}",style: const TextStyle(
                             //color: Colors.white,
                             fontSize: 16,
                           ),),
                           const SizedBox(
                             width: 10,
                           ),
                           const Text("W : ",style: TextStyle(
                             //color: Colors.white,
                               fontSize: 16,
                               fontWeight: FontWeight.w600
                           ),),
                           Text("${widget.data['price']}",style: const TextStyle(
                             //color: Colors.white,
                             fontSize: 16,
                           ),),
                           const Text(" (gm)",style: TextStyle(
                             //color: Colors.white,
                             fontSize: 12,
                           ),),
                           const SizedBox(
                             width: 10,
                           ),
                           const Text("Extra : ",
                             style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.w600
                             ),
                           ),
                           Text("₹${widget.data['extra'] ?? " "}",
                             style: const TextStyle(
                               fontSize: 16,
                             ),
                           ),
                         ],
                       ),

                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          // const Text("Description : ",
                          //   style: TextStyle(
                          //     fontSize: 16,
                          //       fontWeight: FontWeight.w600
                          //   ),
                          // ),
                          Text(widget.data['description'],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      )
          :Center(
    child: Stack(
      children: [
         Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: (){
              setState(() {
                zoom=false;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20,top: 15),
              padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1)
                ),
                child: const Icon(Icons.close,size: 30)),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: InteractiveViewer(
            panEnabled: true, // Set it to false
            boundaryMargin: const EdgeInsets.all(100),
            minScale: 0.5,
            maxScale: 2,
            scaleEnabled: true,
            child: Image.network(
              widget.data['url'].toString(),
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    ),
    ),
    );
  }
}
