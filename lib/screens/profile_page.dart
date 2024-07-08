import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:swe2109772_assignment1/widgets/text_box.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500
          ),
        ),
        backgroundColor: HexColor("#2596be"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg')
              )
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey[400],
                ),
              )
            ],
          ),
          /*const Text(
            'Name',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),*/
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Details',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 22
              ),
            ),
          ),
          
          const TextBox(sectionName: 'Phone No.', inputText: '0102354856'),
          
          const TextBox(sectionName: 'Email', inputText: 'abc@example.com')
        ],
      ),
    );
  }
}