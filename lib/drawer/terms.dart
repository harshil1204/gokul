import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms and Conditions",
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
                  The Application is operated by Gokul Jewellers. So, Throughout the site the terms “us”, “we” and “our' ' refer to the Gokul Jewellers brand. By registering to our application or by placing an order with us you are accepting these Terms and Conditions. Where you have not accepted the Terms and Conditions you have no right to use the content and if you do say should cease using it immediately.

By registering to our site and/or by visiting or site and/or placing an order with us you agree/ engage to our “Service” and are bound to follow the Terms and Conditions which also includes terms of services and policies referenced herein and/or available by hyperlink. The terms and conditions of the site apply to all users of the site, including without limitation users as well who are merchants, vendors, browsers, customers and/or contributors of content.

Our online store is hosted by Sinma Infotech They provide us with the platform to showcase our products online on the e-commerce platform. You have any queries or difficulty relating to our terms and conditions, please contact us before placing an order.

Updates of Terms and Conditions
We may do the changes from time to time for these terms and conditions so please keep updating and check back on a regular interval. The updated terms and conditions are always available on the website/ application. All the versions of terms of conditions shall take effect and will govern the use of the website and relationship with us immediately with the time and date of posting

About Our Hosting Services
Please read our terms and conditions thoroughly before registering or accessing our website. Whether you access any part of the site you are legally bound to the terms and conditions of our website.

Our Privacy Policy
Our information which we collect through our platforms, for instance, the type of information we collect through the medium of our website regarding the visitors of our websites/applications in which we will use the information are taken care by the terms of our Privacy policy.

General Information
 Gokul Jewellers is the application (registered under GST Number 24AOGPK2175L1ZT ). The following terms and conditions are between you and Gokul Jewellers when you buy an item from Gokul Jewellers.The terms and conditions do not affect any statutory rights.
You must be 18+ years to use the website, if you are below 18 years then you can only access the website under the supervision of a guardian. If you are not qualified to use it please don’t use the site.
You are agreed that all the details you are providing us for the purpose of ordering or purchasing gems and jewellery are accurate, true and complete in all aspects. Also, the payment card (debit and credit card) you are using is of your own and you have sufficient funds in your account to cover payment of the product(s) ordered.
While registering yourself with us the username and password you are using will be responsible for all actions taken under that username & password and must only purchase from Gokul Jewellers under your username and password.
It’s a crime to use a false name and payment cards. If anyone is caught in all sense, ordering with false information will be prosecuted under the India constitution.
We reserved all the rights to cancel your order anytime. We can limit the purchase of per person, per household or order.
We have all the rights to suspend you account or access to the site immediately and without notice to you if:-
You will not able to fulfil or made full payment
You breach any of our terms and conditions.
If we found guilty anywhere under the Indian Constitution Law
If we found you engaged, or are about to engage in any type of fraudulent, looting, or any illegal activity.
What you have to do when you break these terms and conditions:
By agreeing to the terms and condition of using our website, you agree that if you break these terms and conditions and any liability will occur out of your use of this website, you will solely be responsible for the cost and other expenses incurred to our employees, directors, officers, agents and suppliers as a result of the breach, including reasonable legal fees (if applicable). If someone else uses your account or your personal information then also you will remain liable unless you can prove that such use was fraudulent.

Ordering-Terms and Conditions:
While placing orders, you agree with all the information provided by you is accurate and complete.
Order competence is only liable or subject to acceptance and product availability.
Our acceptance of order brings a legal bonding between you and us. We do not accept an order from any person below 18 years or from those who are not legally bound by contracts through this site.
We reserve all the rights not to accept or cancel the order if:
We don’t have sufficient stock
We don’t deliver products in your area.
The products you have ordered are priced incorrectly due to typographical error or any other market reasons.
We shall not be bound to offer any benefit for disappointment suffered.
If your order is not been accepted by us then you will receive a mail from us telling you the reason why
Delivery
The delivery period is what in which you will receive your order right after the placement of order till the time it will deliver to your place.
If your delivery address is outside the country or the area we are not delivering, we will not deliver the products and we reserve the right to cancel such order at any moment.
Please note that delivery is the subject matter of delivering a product from one place to another which may exceed the promised time.
Cancelling An Order / Returns Procedure
If you have ordered any product and wish to change it or cancel it, then in this case please contact us ASAP. We will try our best to make any changes but we can’t guarantee it as the order may already be processed. In this case, you have to wait till you receive the order and then you can follow the normal return process.
Once we will get to know you have requested for the cancellation of the product, any amount debited to us from your payment card is being credited back within 14 working days of your order, provided the jewellery has not been dispatched. If it has been dispatched.
You can ask for any product within 2 working days after full payment has been made, acceptance of your order of the contract between us will be completed when the goods have been dispatched.
Damaged and Defective Items:All the parcels you have received you must have to immediately open in the presence of the courier to verify that the parcel is untempered and undamaged. If you fail to do this and find the goods are damaged or not in good condition, we may not be able to claim insurers and couriers. If you fail to do so then you will solely be liable for any such loss or damage and shall release and indemnify us from and against any claims relating thereto, to the fullest extent permitted by applicable law.
If you receive any such items then you have to notify us within 2 working days. We will try our best to resolve the issue ASAP by replacing the item, once the defective item has been returned to us by post.
Entire Agreement
These terms and conditions govern between us. By agreeing on the terms and conditions, you have not relied on any representation of the website/application except where that displaying has been made use of these terms and conditions and you agree that you shall have no problem in respect of any representation of the website/application. Any of your statutory rights are not affected by these terms and conditions. None of the clauses shall limit or exclude our liability in respect of any fraudulent/looting or careless or misrepresentation has become a term of the Conditions.

Contact Information
If you have any questions regarding these Terms & Conditions, please contact us at +91 9408851222
                  
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
