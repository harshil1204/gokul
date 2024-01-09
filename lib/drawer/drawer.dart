import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gokul/drawer/aboutus.dart';
import 'package:gokul/drawer/contactus.dart';
import 'package:gokul/drawer/privacy.dart';
import 'package:gokul/drawer/terms.dart';
import 'package:gokul/resources/color.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
     // backgroundColor: AppColor.primary,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                 DrawerHeader(
                  decoration:  BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(90)
                        )
                        ,child: Image.asset('assets/images/logo.png',height: 90,)),
                        const SizedBox(height: 11,),
                        const Text("Gokul Jewellers",style: TextStyle(
                          fontSize: 22,color: AppColor.white,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  )),

                ListTile(
                  leading: const Icon(
                    Icons.contacts,
                    color: AppColor.black,
                  ),
                  title: const Text('Contact Us',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs(),));
                  },
                  trailing:  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(height: 1,thickness: 0.4,color: AppColor.dividerColor),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.share,
                    color: AppColor.black,
                  ),
                  title: const Text('Share',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  onTap: () async{
                    final url = Uri.parse('https://play.google.com/store/search?q=gokul%20jewellers&c=apps&hl=en&gl=US');
                    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                    throw Exception('Could not launch $url');
                    }
                  },
                  trailing:  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(height: 1,thickness: 0.4,color: AppColor.dividerColor),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.info_outline,
                    color: AppColor.black,
                  ),
                  title: const Text('About Us',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUs(),));
                  },
                  trailing:  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(height: 1,thickness: 0.4,color: AppColor.dividerColor),
                ),

                ListTile(
                  leading: const Icon(
                    Icons.terminal,
                    color: AppColor.black,
                  ),
                  title: const Text('Terms and Conditions',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Terms(),));
                  },
                  trailing:  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(height: 1,thickness: 0.4,color: AppColor.dividerColor),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.privacy_tip_outlined,
                    color: AppColor.black,
                  ),
                  title: const Text('Privacy Policy',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Privacy(),));
                  },
                  trailing:  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(height: 1,thickness: 0.4,color: AppColor.dividerColor),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.star_rate,
                    color: AppColor.black,
                  ),
                  title: const Text('Rate App',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  onTap: () async{
                    final url = Uri.parse('https://play.google.com/store/search?q=gokul%20jewellers&c=apps&hl=en&gl=US');
                    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                    throw Exception('Could not launch $url');
                    }
                  },
                  trailing:  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(height: 1,thickness: 0.4,color: AppColor.dividerColor),
                ),
              ],
            ),
          ),
           Align(
            alignment: Alignment.bottomCenter,
            child:Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: ()async{
                        final url = Uri.parse('https://www.facebook.com/profile.php?id=61551243120905&mibextid=ZbWKwL');
                        if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Image.asset('assets/icon/facebook.png',width: 35,height: 35,fit: BoxFit.fill)),
                  const SizedBox(width: 9,),
                  InkWell(
                      onTap: () async{
                        final url = Uri.parse('https://instagram.com/_gokul_jewellers?igshid=OGQ5ZDc2ODk2ZA==');
                        if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                        throw Exception('Could not launch $url');
                        }
                      },
                      child: Image.asset('assets/icon/instagram.png',width: 35,height: 35,fit: BoxFit.fill)),
                  const SizedBox(width: 9,),
                  InkWell(
                      onTap: () async{
                        var contact = "+919408851222";
                        final url = Uri.parse('whatsapp://send?phone=$contact&text=Hi, I need some help');
                        if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Image.asset('assets/icon/whatsapp.png',width: 35,height: 35,fit: BoxFit.fill)),

                  const SizedBox(width: 9,),
                  InkWell(
                      onTap: () async{
                        final url = Uri.parse('https://maps.app.goo.gl/Ubg4ZumM6fxo23wG9');
                        if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Image.asset('assets/icon/map.png',width: 35,height: 35,fit: BoxFit.fill)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
