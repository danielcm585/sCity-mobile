import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:scity_mobile/components/general/drawer.dart';
import 'package:scity_mobile/pages/auth/login_page.dart';
import 'package:scity_mobile/pages/tender/tender_main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('sCity', style: TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: const AppDrawer(),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Image.asset('assets/images/city-sm.jpeg'),
                Center(
                    child: ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 150),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(0xff, 0xff, 0xff, 0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 17, vertical: 40),
                              child: Column(
                                children: [
                                  const Text(
                                    'Your smart city best partner',
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'sCity is a mobile application that allows you to manage your smart city life that provides tons of services you can use to level up your smart life.',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 26),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()),
                                        );
                                      },
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              const Color.fromRGBO(
                                                  0x10, 0xb9, 0x81, 1)),
                                          foregroundColor: MaterialStateProperty.all(
                                              Colors.white),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ))),
                                      child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Text('Get Started',
                                              style: TextStyle(fontSize: 18))))
                                ],
                              )))),
                ))
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Transparent E-Government',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 14),
                        const Text(
                            "Monitor state revenue budget and easily manage projects' tender.",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        const SizedBox(height: 14),
                        OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TenderMainPage()),
                              );
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(0x10, 0xb9, 0x81, 1)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ))),
                            child: const Text('Tender Now',
                                style: TextStyle(fontSize: 14))),
                      ],
                    )),
                const SizedBox(height: 20),
                Image.asset('assets/images/government.jpg'),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Modern Tourism',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 14),
                        const Text(
                          "Simply explore, manage and book wonderful tourism object from your phone.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 14),
                        OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/place/list');
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(0x10, 0xb9, 0x81, 1)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ))),
                            child: const Text('Tour Now',
                                style: TextStyle(fontSize: 14))),
                      ],
                    )),
                const SizedBox(height: 20),
                Image.asset('assets/images/tourism.jpg'),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Help Environment',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 14),
                        const Text(
                            "Take care of the environment by digitalize the garbage collection system.",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        const SizedBox(height: 14),
                        OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(0x10, 0xb9, 0x81, 1)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ))),
                            child: const Text('Help Now',
                                style: TextStyle(fontSize: 14))),
                      ],
                    )),
                const SizedBox(height: 20),
                Image.asset('assets/images/environment.jpg'),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Seamless Health',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 14),
                        const Text(
                          "Manage your health care with just a few clicks away.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 14),
                        OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(0x10, 0xb9, 0x81, 1)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ))),
                            child: const Text('Check Now',
                                style: TextStyle(fontSize: 14))),
                      ],
                    )),
                const SizedBox(height: 20),
                Image.asset('assets/images/health.webp'),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Modern Agriculture',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 14),
                        const Text(
                            "Help and connect farmers with their own clients and suppliers.",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        const SizedBox(height: 14),
                        OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(0x10, 0xb9, 0x81, 1)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ))),
                            child: const Text('Farm Now',
                                style: TextStyle(fontSize: 14))),
                      ],
                    )),
                const SizedBox(height: 20),
                Image.asset('assets/images/agriculture.webp'),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Modern Marine',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 14),
                        const Text(
                          "Help and connect fishermen with their own clients and suppliers.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 14),
                        OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(0x10, 0xb9, 0x81, 1)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ))),
                            child: const Text('Fish Now',
                                style: TextStyle(fontSize: 14))),
                      ],
                    )),
                const SizedBox(height: 20),
                Image.asset('assets/images/sea.jpg'),
              ],
            ),
            const SizedBox(height: 40),
          ]),
        ));
  }
}
