import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gokul/config/config.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';

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
     // backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.data['name'].toString(),style: const TextStyle(
          fontSize: 22,fontWeight: FontWeight.bold,
        ),),
        actions:  [
          InkWell(
            onTap: () async{
              await Share.share('Name: ${widget.data['name']} \n weight: ${widget.data['price']}(gm) \n extra: ₹${widget.data['extra']}');
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.share,size: 25,),
            ),
          ),
        ],
      ),
      body: zoom==false
          ?Stack(
            children: [
              Opacity(
                opacity: MyConfig.opacity,
                  child: Image.asset(MyConfig.bg,fit: BoxFit.fill,height: double.infinity )),
              SingleChildScrollView(
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
                     constraints: const BoxConstraints(maxHeight: 480),
                      clipBehavior: Clip.hardEdge,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       border: Border.all(color: Colors.grey,width: 2)
                     ),
                     width: double.infinity,
                     //height: 500,
                     child: ClipRRect(
                         borderRadius: BorderRadius.circular(30),
                     child: CachedNetworkImage(imageUrl:widget.data['url'].toString(),
                         placeholder: (context, url) => Image.asset("assets/images/loading.png",width: double.infinity,
                           fit: BoxFit.fill,),
                         fit: BoxFit.fill)),
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
                          ReadMoreText(widget.data['description'],
                            trimLines: 2,
                            trimMode: TrimMode.Line,
                            colorClickableText: Colors.black,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: ' Show less',
                            lessStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700,color: Colors.black),
                            moreStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700,color: Colors.black),
                            style:  const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        )
      ),
            ],
          )
          :Center(
    child: Stack(
      children: [
        Opacity(
            opacity: MyConfig.opacity,
            child: Image.asset(MyConfig.bg,fit: BoxFit.fill,height: double.infinity )),
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
                  border: Border.all(width: 1),
                  color: Colors.black
                ),
                child: const Icon(Icons.close,size: 30,color: Colors.white,)),
          ),
        ),
        Container(
          // margin: const EdgeInsets.only(top: 150),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: InteractiveViewer(
              panEnabled: true, // Set it to false
              boundaryMargin: const EdgeInsets.all(100),
              minScale: 0.5,
              maxScale: 2,
              scaleEnabled: true,
              child: CachedNetworkImage(
               imageUrl:widget.data['url'].toString(),
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) => Image.asset("assets/images/loading.png",width: double.infinity,
                  fit: BoxFit.fill,),
              ),
            ),
          ),
        ),

      ],
    ),
    ),
    );
  }
}
