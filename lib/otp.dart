import 'package:flutter/material.dart';
import 'package:navigate/main.dart';
import 'package:navigate/phone.dart';
import 'package:pinput/pinput.dart';
// import 'package:pinput/pinput.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 45, right: 45),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Elixire',
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
                    'Enter OTP',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Pinput(
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,
                // validator: (s) {
                //   return s == '2222' ? null : 'Pin is incorrect';
                // },
                // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                // onCompleted: (pin) => print(pin),
              ),
              SizedBox(height: 60,),
              SizedBox(
                  height: 38,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute (builder: (context) => MyHomePage(title: 'Flutter navigation screen', controller: widget.controller)));
                  },
                    child: Text(
                      'Validate',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(84, 130, 53, 50),
                        //primary: Color.fromRGBO(84, 130, 53, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  )
              ),
              SizedBox(height: 36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't get the code ",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    onTap: (){},
                  ),
                ],
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: 200,
                child: OutlinedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute (builder: (context) => MyPhone()));
                },
                  child: Text("Change Number",
                    style: TextStyle(
                      color: Color.fromRGBO(84, 130, 53, 50),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    //primary: Color.fromRGBO(84, 130, 53, 50),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),

                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
