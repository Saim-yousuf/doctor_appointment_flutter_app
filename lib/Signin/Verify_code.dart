import 'package:doctor_appointment/Signin/create_new_pass.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  var code = '';
  final defaultPinTheme = PinTheme(
    width: 70,
    height: 70,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final focusedPinTheme = PinTheme(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ));

  final submittedPinTheme = PinTheme(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Center(
                child: Image.asset(
                  "assets/png/img logo.png",
                  height: 70,
                  width: 80,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Health",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 24,
                    ),
                    children: [
                      TextSpan(
                        text: "Pal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Verify Code",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Enter the Code \nwe just send you on your registered Email",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                onChanged: (value) {
                  code = value;
                },
                showCursor: true,
                // ignore: avoid_print
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateNewPass(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color.fromARGB(255, 8, 48, 81),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Reset Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
