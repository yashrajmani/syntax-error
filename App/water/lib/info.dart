import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.blueGrey,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  print("--close pressed---");
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'CLOSE',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Icon(
                      Icons.close,
                      size: 25,
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 5,
                  primary: Colors.blue,
                  shadowColor: Colors.blueGrey,
                ),
              ),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    "Ways to Save Water:",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  Divider(
                    thickness: 2,
                    endIndent: 20,
                    indent: 20,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      "Without water, the earth would look like the moon. All living things need water to live. \n\nPeople can live several weeks without food, but only a few days without water.\n\nWe should drink six to eight glasses of water each day! \n\nWater makes up 83% of our blood, 70% of our brain, and 90% of our lungs. Overall, our bodies are 70% water. \n\nKeep a pitcher of water in the refrigerator. Then you wont have to run tap water to cool it. \n\nUse water only when you need it. Don't leave water running; be sure to turn it off when you are finished.\n\nUse a bucket of water to wash your bike or the family car and rinse quickly with a hose. \n\nKeep a pitcher of water in the refrigerator. Then you wont have to run tap water to cool it.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.justify,
                    ),

                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      "Check household faucets for leaks. A faucet with even a slow drip takes 10 to 25 gallons of water. Just think, 15 drips per minute add up to almost 3 gallons of water wasted per day, 65 gallons wasted per month, and 788 gallons wasted per year!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),


                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
