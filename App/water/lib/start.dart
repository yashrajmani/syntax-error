import 'package:flutter/material.dart';

import 'home.dart';

class Start extends StatefulWidget {
  const Start({super.key, required this.title});

  final String title;

  @override
  State<Start> createState() => _Start();
}

class _Start extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exit(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.blue.shade300,
              Colors.blue.shade200,
              Colors.blue.shade100,
              Colors.blue.shade50,
              Colors.blue.shade50,
              Colors.blue.shade50,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
            elevation: 5,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 150,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Your own Water Guard",
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 4.5,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Center(
                  child: Text(
                    "Save Blue 💧 , Live Green 🏡",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.9,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Get Started ',
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
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Icon(
                              Icons.arrow_forward,
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
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(
                    'assets/abc.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//EXIT POPUP
Future<bool> exit(BuildContext context) async {
  return await showDialog(
    builder: (context) => AlertDialog(
      title: Text("Exit !"),
      content: Text("Confirm, you want to quit Tank-E?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Yes")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("No")),
      ],
    ),
    context: context,
  );
}
