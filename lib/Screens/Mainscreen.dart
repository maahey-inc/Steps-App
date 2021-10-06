import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:steps_app/Screens/Login.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

class MainSceeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("Assets/Images/person.png"),
            SizedBox(
              height: 35,
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
            GoogleAuthButton(
              onPressed: () {},
              darkMode: false,
              style: AuthButtonStyle(
                height: 50,
                //iconType: AuthIconType.outlined,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Divider(
              thickness: 3,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone_android),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Sign Up With Mobile",
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                })
            // Container(
            //     height: 60,
            //     color: darkgrey,
            //     child: ),
          ],
        ),
      ),
    );
  }
}
