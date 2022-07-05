import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.white,
              margin: EdgeInsets.only(left: 35, right: 35, top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "img/menu.svg",
                      width: 20,
                      height: 20,
                      color: Color.fromARGB(255, 204, 204, 204),
                    ),
                    Text(
                      "Foodiko",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 12, 41, 136)),
                    ),
                    SvgPicture.asset("img/user_round.svg",
                        width: 30,
                        height: 30,
                        color: Color.fromARGB(255, 204, 204, 204))
                  ]),
            ),
            SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 5),
              child: Text(
                'Hi Sanju!',
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 3, 52, 116)),
              ),
            ),
            Container(
              width: size.width * .8,
              height: 200,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(255, 6, 105, 218),
                        Color.fromARGB(255, 3, 52, 116)
                      ])),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    //color: Colors.green,
                    margin: EdgeInsets.only(left: 25, top: 30),
                    child: Text(
                      "Enjoy food with\nyour freinds!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 150,
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50,
                      height: 80,
                      child: Column(children: [
                        SizedBox(
                          height: 8,
                        ),
                        SvgPicture.asset(
                          'img/wallet.svg',
                          height: 30,
                          width: 30,
                          color: Color.fromARGB(255, 0, 65, 117),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Wallet')
                      ]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 221, 221, 221),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 80,
                      child: Column(children: [
                        SizedBox(
                          height: 8,
                        ),
                        SvgPicture.asset(
                          'img/chat.svg',
                          height: 30,
                          width: 30,
                          color: Color.fromARGB(255, 0, 65, 117),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Chat')
                      ]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 221, 221, 221),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 80,
                      child: Column(children: [
                        SizedBox(
                          height: 8,
                        ),
                        SvgPicture.asset(
                          'img/friends.svg',
                          height: 30,
                          width: 30,
                          color: Color.fromARGB(255, 0, 65, 117),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Friends')
                      ]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 221, 221, 221),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 80,
                      child: Column(children: [
                        SizedBox(
                          height: 8,
                        ),
                        SvgPicture.asset(
                          'img/review.svg',
                          height: 30,
                          width: 30,
                          color: Color.fromARGB(255, 0, 65, 117),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Review')
                      ]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 221, 221, 221),
                      ),
                    ),
                  ],
                )),
            Container(
              //color: Colors.green,
              padding: EdgeInsets.only(left: 25),
              width: 50,
              height: 50,
              child: Row(
                children: [
                  Text(
                    'Most ordered food',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 204, 204, 204)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: size.width * .55,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 204, 204, 204),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 210,
              //color: Colors.green,
              child: Padding(
                
                padding: const EdgeInsets.only(left: 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        margin: EdgeInsets.only(left: 25),
                        color: Colors.transparent,
                        elevation: 300,
                        child: Container(
                          width: 120,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(children: [
                            Image.asset(
                              'img/dosa.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              width: 95,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 204, 204, 204),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Text(
                                    'Dosa',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Rs 12.0')
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                              ),
                            )
                          ]),
                        ),
                      ),
                      Card(
                         margin: EdgeInsets.only(left: 25),
                        color: Colors.transparent,
                        elevation: 300,
                        child: Container(
                          width: 120,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(children: [
                            Image.asset(
                              'img/dosa.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              width: 95,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 204, 204, 204),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Text(
                                    'Dosa',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Rs 12.0')
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                              ),
                            )
                          ]),
                        ),
                      ),
                      Card(

                         margin: EdgeInsets.only(left: 25),
                        color: Colors.transparent,
                        elevation: 300,
                        child: Container(
                          width: 120,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(children: [
                            Image.asset(
                              'img/dosa.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              width: 95,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 204, 204, 204),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Text(
                                    'Dosa',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Rs 12.0')
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                              ),
                            )
                          ]),
                        ),
                      ),
                      Card(
                         margin: EdgeInsets.only(left: 25,right: 15),
                        color: Colors.transparent,
                        elevation: 300,
                        child: Container(
                          width: 120,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(children: [
                            Image.asset(
                              'img/dosa.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.fitWidth,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              width: 95,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 204, 204, 204),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Text(
                                    'Dosa',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Rs 12.0')
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                              ),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
