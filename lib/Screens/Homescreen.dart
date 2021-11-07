import 'package:flutter/material.dart';
import 'package:steps_app/Widgets/Button.dart';
import 'package:steps_app/theme.dart';

class Homescreen extends StatelessWidget {
  //const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sat"),
                Text("Sun"),
                Text("Mon"),
                Text("Tue"),
                Text("Wed"),
                Text("Thu"),
                Text("Fri"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.asset(
                                "Assets/Images/book.png",
                                color: Colors.white,
                                //height: 50,
                                //fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "3m",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            Text(
                              "Reading Today",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      height: 190,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black,
                        border: Border.all(color: Color(0xff08B2F6), width: 6),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff08B2F6),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Button(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Reports"),
                      ),
                      onpressed: () {},
                      color: darkgrey2,
                      radius: 23,
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.asset(
                                "Assets/Images/running.png",
                                color: Colors.white,
                                //height: 50,
                                //fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "1500",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            Text(
                              "Steps Today",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black,
                        border: Border.all(color: Colors.yellow, width: 6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow,
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Button(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Reports"),
                      ),
                      onpressed: () {},
                      color: darkgrey2,
                      radius: 23,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: darkgrey, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Invite Friends",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "(0/20)",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: darkgrey3,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Lorem ipsum dolor sit et, ntur sadipscing Elitr, Sed "),
                        ],
                      ),
                    ),
                    Button(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                          children: [
                            Text("Get For "),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "Assets/Images/g.png",
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("5 "),
                          ],
                        ),
                      ),
                      color: darkgrey2,
                      onpressed: () {},
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: darkgrey, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Read to Gain",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum dolor sit et, ntur sadipscing Elitr, Sed Diam",
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.network(
                              "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzMzk4NjYwMzU3/image-placeholder-title.jpg",
                              //fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.network(
                                "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzNjY3MzU3OTU3/image-placeholder-title.jpg"),
                          )
                        ],
                      ),
                      height: 130,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: darkgrey, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Daily Bonus Read",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consetetur sadscing elitr, sed diam nonumy eirmod.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: darkgrey4,
                        fontWeight: FontWeight.bold,
                        //fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Container(
                            child: Center(
                              child: Icon(
                                Icons.play_arrow,
                                color: darkgrey3,
                                size: 50,
                              ),
                            ),
                            width: 90,
                            decoration: BoxDecoration(
                                color: darkgrey2,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        top: 5,
                                        right: 5,
                                        child: Icon(
                                          Icons.lock,
                                          color: darkgrey3,
                                          size: 30,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "Assets/Images/book.png",
                                            color: darkgrey3,
                                            height: 25,

                                            //fit: BoxFit.fill,
                                          ),
                                          SizedBox(
                                            width: 60,
                                            child: Divider(
                                              color: darkgrey3,
                                              thickness: 2,
                                            ),
                                          ),
                                          Text(
                                            "1000",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: darkgrey3,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: darkgrey2,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          top: 5,
                                          right: 5,
                                          child: Icon(
                                            Icons.lock,
                                            color: darkgrey3,
                                            size: 30,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "Assets/Images/book.png",
                                              color: darkgrey3,
                                              height: 25,

                                              //fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              width: 60,
                                              child: Divider(
                                                color: darkgrey3,
                                                thickness: 2,
                                              ),
                                            ),
                                            Text(
                                              "1500",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: darkgrey3,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    width: 90,
                                    decoration: BoxDecoration(
                                        color: darkgrey2,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 130,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Daily Bonus Walk",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consetetur sadscing elitr, sed diam nonumy eirmod.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: darkgrey4,
                        fontWeight: FontWeight.bold,
                        //fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Container(
                            child: Center(
                              child: Icon(
                                Icons.play_arrow,
                                color: darkgrey3,
                                size: 50,
                              ),
                            ),
                            width: 90,
                            decoration: BoxDecoration(
                                color: darkgrey2,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        top: 5,
                                        right: 5,
                                        child: Icon(
                                          Icons.lock,
                                          color: darkgrey3,
                                          size: 30,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "Assets/Images/running.png",
                                            color: darkgrey3,
                                            height: 30,

                                            //fit: BoxFit.fill,
                                          ),
                                          SizedBox(
                                            width: 60,
                                            child: Divider(
                                              color: darkgrey3,
                                              thickness: 2,
                                            ),
                                          ),
                                          Text(
                                            "1000",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: darkgrey3,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: darkgrey2,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          top: 5,
                                          right: 5,
                                          child: Icon(
                                            Icons.lock,
                                            color: darkgrey3,
                                            size: 30,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "Assets/Images/running.png",
                                              color: darkgrey3,
                                              height: 30,

                                              //fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              width: 60,
                                              child: Divider(
                                                color: darkgrey3,
                                                thickness: 2,
                                              ),
                                            ),
                                            Text(
                                              "1500",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: darkgrey3,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    width: 90,
                                    decoration: BoxDecoration(
                                        color: darkgrey2,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 130,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
      appBar: AppBar(
        leading: Image.asset("Assets/Images/cart.png"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Button(
              child: Row(
                children: [
                  Image.asset("Assets/Images/s.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "500",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              onpressed: () {},
              radius: 20,
              color: darkgrey2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Button(
              child: Row(
                children: [
                  Image.asset("Assets/Images/g.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "5",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              onpressed: () {},
              radius: 20,
              color: darkgrey2,
            ),
          )
        ],
      ),
    );
  }
}
