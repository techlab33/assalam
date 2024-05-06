import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.green,
                  Colors.blue,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          ),
          Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 12,left: 8),
              child: IconButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(),));
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 20,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: const Center(
                        child: Text(
                          'Go Premium',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sayed Sajib',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text('Member since:22 Apr 2024',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: const Center(
                        child: Text(
                          'Edit profile',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 10,
                  color: Colors.grey,
                ),
                const Text(
                  'Journey',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 160,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Read the Quran',
                              style:
                              TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 160,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Track Prayers',
                              style:
                              TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5),
                const Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.green),
                            SizedBox(width: 5),
                            Text('0',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Text('Days Prayed',
                            style: TextStyle(color: Colors.white, fontSize: 16))
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.watch,
                              color: Colors.green,
                            ),
                            SizedBox(width: 5),
                            Text('--',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Text('khatamas',
                            style: TextStyle(color: Colors.white, fontSize: 16))
                      ],
                    )
                  ],
                ),
                const Divider(
                  thickness: 5,
                  color: Colors.grey,
                ),
                const Text(
                  'Streak',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.green,
                        Colors.purple,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.mosque,
                        size: 50,
                      ),
                      Text(
                        'DONT LIKE ADS?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 120,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                          child: const Center(
                              child: Text(
                                'GET PREMIUM',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}