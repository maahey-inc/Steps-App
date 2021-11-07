import 'dart:async';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:steps_app/Screens/verificationcode.dart';
import 'package:steps_app/Services/Auth_Services.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String countryCode = '+962';

  String initialcountry = 'uae';

  int start = 30;
  bool wait = false;
  String buttonName = "Send";
  TextEditingController phoneController = TextEditingController();
  AuthClass authClass = AuthClass();
  String verificationIdFinal = "";
  String smsCode = "";

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "Assets/Images/shoe.png",
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Run and Read",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                child: Icon(
                  Icons.phone_android,
                  size: 60,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Lorem ipsum dolor sit amet, ntur sadipscing Elitr, Sed ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                height: 50,
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          CountryCodePicker(
                            textStyle: TextStyle(color: Colors.white),
                            padding: EdgeInsets.zero,
                            initialSelection: "jordan",
                            showCountryOnly: true,
                            flagWidth: 30,
                            backgroundColor: Colors.black,
                            dialogBackgroundColor: Colors.black,
                            dialogSize: Size(
                                MediaQuery.of(context).size.width - 50,
                                MediaQuery.of(context).size.height - 100),
                            onChanged: (code) {
                              // countryCode = code.dialCode;
                              // selectedcountry = code.name;
                              print(countryCode);
                              print(code.name);
                            },
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    Expanded(
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          hintText: 'Mobile No.',
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: wait
                          ? null
                          : () async {
                              setState(() {
                                start = 30;
                                wait = true;
                                buttonName = "Resend";
                              });
                              await authClass.verifyPhoneNumber(
                                  "+923485551899", context, setData);
                            },
                      child: Text("Send"),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: darkgrey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    Text(
                      "Enter 6 digit OTP",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: PinCodeTextField(
                  autofocus: true,
                  //controller: controller,
                  hideCharacter: true,
                  highlight: true,
                  //highlightColor: Colors.blue,
                  defaultBorderColor: Colors.black,
                  hasTextBorderColor: darkgrey,
                  highlightPinBoxColor: darkgrey,
                  maxLength: 6,
                  // hasError: hasError,
                  maskCharacter: "*",
                  onTextChanged: (text) {
                    // setState(() {
                    //   hasError = false;
                    // });
                  },
                  onDone: (text) {
                    setState(() {
                      smsCode = text;
                    });
                    // print("DONE $text");
                    // print("DONE CONTROLLER ${controller.text}");
                  },
                  pinBoxWidth: 40,
                  pinBoxHeight: 40,
                  pinBoxRadius: 5,
                  //hasUnderline: true,
                  wrapAlignment: WrapAlignment.spaceAround,
                  pinBoxDecoration:
                      ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  pinTextStyle: TextStyle(fontSize: 22.0),
                  pinTextAnimatedSwitcherTransition:
                      ProvidedPinBoxTextAnimation.scalingTransition,
                  // pinBoxColor: Colors.green[100],
                  pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                  //                    highlightAnimation: true,
                  highlightAnimationBeginColor: Colors.black,
                  highlightAnimationEndColor: Colors.white12,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Send OTP again in ",
                      style:
                          TextStyle(fontSize: 16, color: Colors.yellowAccent),
                    ),
                    TextSpan(
                      text: "00:$start",
                      style: TextStyle(fontSize: 16, color: Colors.pinkAccent),
                    ),
                    TextSpan(
                      text: " sec ",
                      style:
                          TextStyle(fontSize: 16, color: Colors.yellowAccent),
                    ),
                  ],
                )),
              ),
              Button(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  onpressed: () {
                    authClass.signInwithPhoneNumber(
                        verificationIdFinal, smsCode, context);

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => VerificationcodeScreen()));
                  })
              // Container(
              //     height: 60,
              //     color: darkgrey,
              //     child: ),
            ],
          ),
        ),
      ),
    );
  }
}
