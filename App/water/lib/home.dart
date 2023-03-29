import 'package:flutter/material.dart';
import 'package:sms_maintained/sms.dart' as SS;
import 'package:telephony/telephony.dart';
import 'package:water/contact.dart';
import 'package:water/info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;
  bool five = false;
  bool six = false;

  int x = 0;

  String ans = '';

  @override
  void initState() {
    // TODO: implement initState
    SS.SmsSender sender = SS.SmsSender();
    Telephony telephony = Telephony.instance;

    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        print("------- MSG ------------------------");
        print(message.address); //nubmer
        print(message.body); //text
        print(message.date); // timestamp
        setState(() {
          ans = message.body.toString();
        });

        print("------- MSG ------------------------");
      },
      listenInBackground: false,
    );

    update2();

    super.initState();
  }

  SS.SmsSender sender = SS.SmsSender();
  Telephony telephony = Telephony.instance;

  //SEND SMS----------
  void SendMsg(String sms, String num) {
    String address = num;
    SS.SmsMessage message = SS.SmsMessage(address, sms);
    message.onStateChanged.listen((state) {
      if (state == SS.SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SS.SmsMessageState.Delivered) {
        print("SMS is delivered!");

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(sms + " REQUEST is delivered! "),
          duration: Duration(milliseconds: 700),
        ));
      }
    });
    sender.sendSms(message);
  }

  void update2() {
    Telephony telephony = Telephony.instance;

    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        print("------- MSG ------------------------");
        print(message.address); //nubmer
        print(message.body); //text
        print(message.date); // timestamp
        setState(() {
          ans = message.body.toString();
        });
        if (ans != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(ans),
            duration: Duration(milliseconds: 700),
          ));
          setState(() {});
        }
        print("------- MSG ------------------------");
      },
      listenInBackground: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tank-E"),
        actions: [
          PopupMenuButton<MenuItem>(
            padding: EdgeInsets.all(8.0),
            icon: Icon(
              Icons.menu,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    print("INFO --------");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Info()));
                  },
                  child: Icon(
                    Icons.info,
                    color: Color(0xff051094),
                  ),
                ),
              ),
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    print(" HELP -----------");

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Contact()));
                  },
                  child: Icon(
                    Icons.person_add,
                    color: Color(0xff051094),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Water Level',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    color: six ? Colors.blue : Colors.blueGrey,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                    color: five ? Colors.blue : Colors.blueGrey,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                    color: four ? Colors.blue : Colors.blueGrey,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                    color: three ? Colors.blue : Colors.blueGrey,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                    color: two ? Colors.blue : Colors.blueGrey,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                    color: one ? Colors.blue : Colors.red,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Divider(
              thickness: 2,
              endIndent: 20,
              color: Colors.blue,
              indent: 20,
            ),
            Container(
              color: Colors.blue,
              height: 60,
              width: 300,
              child: Center(
                  child: Text(
                ans,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'ON',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Icon(
                              Icons.play_arrow_sharp,
                              size: 22,
                            ),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        elevation: 6,
                        primary: Color(0xff051094),
                        shadowColor: Colors.blueGrey,
                      ),
                      onPressed: () {
                        print("------- ON PRESSED ---------------- ");

                        SendMsg("ON", "9606119310");

                        Future.delayed(Duration(seconds: 3));

                        update2();




                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'OFF',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Icon(
                              Icons.pause,
                              size: 22,
                            ),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        elevation: 6,
                        primary: Color(0xff051094),
                        shadowColor: Colors.blueGrey,
                      ),
                      onPressed: () {
                        print("------- OFF PRESSED ---------------- ");
                        SendMsg("OFF", "9606119310");
                        Future.delayed(Duration(seconds: 3));

                        update2();

                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.88,
                child: ElevatedButton(
                  child: const Text(
                    'Check Status',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation: 6,
                    primary: Colors.blue,
                    shadowColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    SendMsg("CHECK", "8295556198");
                    Future.delayed(Duration(seconds: 3));

                    update2();

                    setState(() {
                      x++;

                      if (x == 1) {
                        one = true;
                      } else if (x == 2) {
                        two = true;
                      } else if (x == 3) {
                        three = true;
                      } else if (x == 4) {
                        four = true;
                      } else if (x == 5) {
                        five = true;
                      } else if (x == 6) {
                        six = true;
                      } else if (x > 6) {
                        x == 1;
                        one = false;
                        two = false;
                        three = false;
                        four = false;
                        five = false;
                        six = false;
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
