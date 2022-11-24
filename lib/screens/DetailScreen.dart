import 'package:api_kullanimi/update_screen.dart';
import 'package:api_kullanimi/models/users_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        elevation: 15,
        backgroundColor: Colors.red,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            ListItems(text1: "Name", text2: user.name,fontSize: 18,),
            ListItems(text1: "Username", text2: user.username,fontSize: 18,),
            ListItems(text1: "Email", text2: user.email,fontSize: 18,),
            ListItems(text1: "Phone", text2: user.phone,fontSize: 18,),
            ListItems(text1: "Website", text2: user.website,fontSize: 18,),
            ListItems(text1: "Company Name", text2: user.company.name,fontSize: 18,),
            ListItems(text1: "* Company CatchPhrase", text2: user.company.catchPhrase,fontSize: 16,),
            ListItems(text1: "* Company Bs", text2: user.company.bs,fontSize: 16,),
            ListItems(text1: "Address", text2: user.address.city + user.address.street + user.address.suite,fontSize: 18,),
            ListItems(text1: "* Zipcode", text2: user.address.zipcode,fontSize: 16,),
            ListItems(text1: "* Latitute - Longtitute", text2: "${user.address.geo.lat} , ${user.address.geo.lng}",fontSize: 16,),

            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>  UpdateScreen(user: user))),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.only(left: 150, right: 150,top: 10,bottom: 10),
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                  shadowColor: Colors.black,
                ),
                child: const Text("EDIT"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
class ListItems extends StatelessWidget {
  const ListItems({Key? key, required this.text1, required this.text2, required this.fontSize}) : super(key: key);

  final String text1;
  final String text2;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$text1: ",
                style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  text2,
                  style: TextStyle(fontSize: fontSize),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 0.5, indent: 5, endIndent: 5),
      ],
    );
  }
}
