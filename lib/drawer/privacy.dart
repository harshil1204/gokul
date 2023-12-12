import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy",
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
This privacy policy of this company discloses the privacy terms practice for this website. The privacy policy for this website also includes solely information collected by this website/application. The following information will be notified to you:
What liable information is collected from you on the website/application, where & how it will be used and with whom it may be shared?
The security parameters used to keep your information safe and protect from misuse.
How can you correct the glitch in the information?
How long will you keep your information with us?
How will we use ‘COOKIES’?
Collection of Information and Sharing:
The information we will collect from the website will be used to share and communicate with you when required.
We will require your personal information to fulfil the orders and notify you for the special deals and offers.
We will also use the information you provide for contest, promotion, survey or other site feature
To send you an email regarding your order procedure, so you can track your orders.
We will also keep you updated on the company’s latest news, updates, related product or service information, etc.
To improve our website offerings based on the suggestions and feedback we receive from you.
Safety of Information
When you provide any personal information with us online and offline. Whenever we will collect any personal information for instance (Your mobile number, email Id or credit card number for orders). We take all the precaution to protect your data or information provided by you on our website/application.

All this information will be fully encrypted and secured with us. You can ensure this by looking for a closed lock icon mentioned at the address bar of the website.

Information You Can Access and Change Anytime
If you want to change the information you have submitted in the future with us, you can change it anytime by sending us an email or contacting us through the phone number given on our site. The procedure to change the information is:

See what information our database has about you.
Change/Correct or provide new data about you.
Also, let us know if you have any concern about how we use your information.
How Long Will Keep Your Information With Us?
We will only keep your personal information with us till the time we have to execute the purpose for which you have submitted the data at our website/application. Also, we keep your relevant data with us to respond to a query, notify you for the latest offers, and to fulfil an order. On your request, we will delete your data or information.

How will we use ‘COOKIES’?
Whenever you will add or place an order you will register yourself by providing your name and other details with us, you will become our permanent user and we will send cookies to track your preferences. COOKIES are the small files that may be placed in your computer’s data and used to keep a track to recognize you when you visit the website/application and make use of our services so that we can tailor our services as per your needs. For instance, we can keep your wish list and track your cart as well as making your online experience more efficient.

By using our website/application. you imply your approval to the terms of our privacy policy. We reserve the right, in our sole preference, to modify, change, add or delete parts of the terms of this privacy policy at any time.
                  
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
