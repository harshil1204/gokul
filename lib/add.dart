


import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    DateTime now =  DateTime.now();
    // var datestamp = DateFormat("yyyyMMdd'T'HHmmss");
    // String currentdate = datestamp.format(now);

      //Select Image
     final image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null){
        //Upload to Firebase
        var snapshot = await _firebaseStorage.ref()
            .child('images/$now.jpg')
            .putFile(File(image.path));
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Image Path Received');
      }
  }

  CollectionReference students = FirebaseFirestore.instance.collection('data');
  addData()async{
    DateTime now =  DateTime.now();
    await students.doc(now.toString()).set({
      'name':name.text.toString(),
      'link':url.text.toString(),
      'imageUrl':imageUrl.toString()
    }).then((value) => print("successfully Added...."));
  }

  /*Future<String>photoOption() async {
    try {
      DateTime now =  DateTime.now();
      var datestamp = DateFormat("yyyyMMdd'T'HHmmss");
      String currentdate = datestamp.format(now);
      XFile? imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);


      StorageReference ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child("$currentdate.jpg");
      StorageUploadTask uploadTask = ref.putFile(imageFile);

      Uri downloadUrl = (await uploadTask.future).downloadUrl;
      addUser.downloadablelink = downloadUrl.toString();

      downloadableUrl = downloadUrl.toString();

      print(downloadableUrl);

    } catch (error) {
      print(error);
    }

    return downloadableUrl;
  }*/

  final TextEditingController name = TextEditingController();
  final TextEditingController url = TextEditingController();
  final TextEditingController _photo = TextEditingController();
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  hintText: "Enter Name",
                  label: Text("name"),
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: url,
                decoration: const InputDecoration(
                  hintText: "Enter url",
                  label: Text("url"),
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              Text("Select image.."),
              InkWell(
                onTap: (){
                  uploadImage();
                },
                child: Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(color: Colors.white),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(2, 2),
                          spreadRadius: 2,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: (imageUrl == null && imageUrl =="")
                        ? Icon(Icons.photo)
                        : Image.network(imageUrl.toString(),height: 50,fit: BoxFit.fill,)
                ),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                child: Text("Upload Image", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                onPressed: (){
                 addData();
                 imageUrl="";
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
