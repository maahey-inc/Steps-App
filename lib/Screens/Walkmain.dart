import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:steps_app/Widgets/Button.dart';

import '../theme.dart';

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTH_NOT_GRANTED
}

class Walkmainscreen extends StatefulWidget {
  @override
  _WalkmainscreenState createState() => _WalkmainscreenState();
}

class _WalkmainscreenState extends State<Walkmainscreen> {
  List<HealthDataPoint> _healthDataList = [];

  AppState _state = AppState.DATA_NOT_FETCHED;

  int steps = 0;

  Future fetchData() async {
    // get everything from midnight until now
    DateTime startDate = DateTime.now().subtract(Duration(days: 1));
    DateTime endDate = DateTime.now();

    HealthFactory health = HealthFactory();

    // define the types to get
    List<HealthDataType> types = [
      HealthDataType.STEPS,
      HealthDataType.DISTANCE_DELTA,
      HealthDataType.WEIGHT,
      //HealthDataType.HEIGHT,
      //HealthDataType.BLOOD_GLUCOSE,
      //HealthDataType.DISTANCE_WALKING_RUNNING,
    ];

    //setState(() => _state = AppState.FETCHING_DATA);

    print("getting Access");

    // you MUST request access to the data types before reading them
    bool accessWasGranted = await health.requestAuthorization(types);
    print(accessWasGranted);
    steps = 0;

    if (accessWasGranted) {
      try {
        // fetch new data
        List<HealthDataPoint> healthData =
            await health.getHealthDataFromTypes(startDate, endDate, types);

        // save all the new data points
        _healthDataList.addAll(healthData);
      } catch (e) {
        print("Caught exception in getHealthDataFromTypes: $e");
      }

      // filter out duplicates
      _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

      Future.forEach(_healthDataList, (x) {
        steps += x.value.round();
      });
      // print the results
      setState(() {
        steps = (steps + steps / 1.8).round();
      });
      print("Steps: ${steps + steps / 1.8}");

      // update the UI to display the results
      // setState(() {
      //   _state =
      //       _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
      // });
    } else {
      print("Authorization not granted");
      // setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Day",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Week",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Month",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            "Assets/Images/running.png",
                            color: Colors.white,
                            height: 50,
                            //fit: BoxFit.fill,
                          ),
                          Text(
                            steps.round().toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 70,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Steps",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                              Text(
                                "(7 Days)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    height: 300,
                    width: 300,
                    // width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Image.asset(
                              "Assets/Images/fire.png",
                              //height: 30,
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 13, horizontal: 15),
                            decoration: BoxDecoration(
                                border: Border.all(color: darkgrey4, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ((steps - steps / 1.8) / 1000).toStringAsFixed(2) +
                                " Km",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Image.asset(
                              "Assets/Images/chart.png",
                              //height: 30,
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            decoration: BoxDecoration(
                                border: Border.all(color: darkgrey4, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "1.2 Mi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Image.asset(
                              "Assets/Images/timer.png",
                              color: Colors.white,
                              //height: 30,
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            decoration: BoxDecoration(
                                border: Border.all(color: darkgrey4, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "150 min",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
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
                        "Weekly Reports",
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
                      Text(
                        "\nChart will come here, I couldn't find the suitable chart that's why didn't add it yet",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: darkgrey4,
                          fontWeight: FontWeight.bold,
                          //fontSize: 16,
                        ),
                      ),
                      // SizedBox(
                      //   child: ListView(
                      //     scrollDirection: Axis.horizontal,
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.all(10),
                      //         child: Image.network(
                      //           "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzMzk4NjYwMzU3/image-placeholder-title.jpg",
                      //           //fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.all(10),
                      //         child: Image.network(
                      //             "https://www.writersdigest.com/.image/t_share/MTcxMDY1ODEzNjY3MzU3OTU3/image-placeholder-title.jpg"),
                      //       )
                      //     ],
                      //   ),
                      //   height: 130,
                      // )
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
                        "Daily Bonus",
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
              )
            ],
          ),
        ),
      )),
    );
  }
}
