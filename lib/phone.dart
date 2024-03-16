// for navigation app

import 'package:flutter/material.dart';
import 'package:navigate/otp.dart';
import 'package:navigate/phonetextfield.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 45, right: 45),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Naviway',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '             Assist',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),

              SizedBox(height: 30,),

              Row(

                children: [
                  Text(
                    'Phone',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 30,),
              // TextField(), // this is star field
              PhoneTextField(controller: _phoneController),

              SizedBox(height: 120,),
              SizedBox(
                  height: 38,
                  width: 180,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute (builder: (context) => MyOtp(controller: _phoneController,)));
                  },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      //primary: Color.fromRGBO(84, 130, 53, 50),
                      backgroundColor: Colors.pink.shade200,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
