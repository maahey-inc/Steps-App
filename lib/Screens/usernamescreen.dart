import 'package:auth_buttons/auth_buttons.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:steps_app/Screens/verificationcode.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

import 'HomePage.dart';



class UsernameScreen extends StatefulWidget {
  @override
  _UsernameScreenState createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
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
          padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 100,
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 80,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Your Name",
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
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'UserName',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
                decoration: BoxDecoration(
                  color: darkgrey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Button(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    child: Text(
                      "Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  onpressed: () {
                    showCupertinoModalBottomSheet(
                      context: context,
                      builder: (context) => Material(
                        child: Container(
                          height: 600,
                          color: darkgrey,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Button(
                                      child: Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              "Assets/Images/fit.png",
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Google Fit",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onpressed: () {
                                        // fetchData();
                                      },
                                      color: Color(0xff333333),
                                      radius: 20,
                                    ),
                                    Text(
                                      "∞",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                      ),
                                    ),
                                    Button(
                                      child: Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              "Assets/Images/shoe.png",
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Our App",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onpressed: () {},
                                      color: Color(0xff333333),
                                      radius: 20,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    "Your Name",
                                    //textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    "Lorem ipsum dolor sit amet, consetetur  sadipscing elitr, sed diam nonumy eirmod tempor invidunt\n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod \n\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt",
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Button(
                                      color: Color(0xff333333),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                        ),
                                        child: Text(
                                          "Link",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      onpressed: () {
                                        Navigator.pop(context);
                                        // fetchData();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()));
                                      }),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Exit App",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
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
