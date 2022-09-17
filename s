
            Container(
                height: 90,
                //color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50,
                      height: 70,
                      child: Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        SvgPicture.asset(
                          'img/wallet.svg',
                          height: 30,
                          width: 30,
                          color: t_clr,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Wallet',
                          style: TextStyle(color: Color.fromARGB(255, 29, 29, 29)),
                        )
                      ]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: s_blk2,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 70,
                      child: Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        SvgPicture.asset(
                          'img/chat.svg',
                          height: 30,
                          width: 30,
                          color: t_clr,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Chat', style: TextStyle(color: Colors.white))
                      ]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: s_blk2,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 70,
                      child: Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        SvgPicture.asset(
                          'img/friends.svg',
                          height: 30,
                          width: 30,
                          color: t_clr,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Friends', style: TextStyle(color: Colors.white))
                      ]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: s_blk2,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 70,
                      child: Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        SvgPicture.asset(
                          'img/review.svg',
                          height: 30,
                          width: 30,
                          color: t_clr,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Review', style: TextStyle(color: Colors.white))
                      ]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: s_blk2,
                      ),
                    ),
                  ],
                )),
                Container(margin: EdgeInsets.only(left: 50,right: 50,top:5 ,bottom: 5),width: 200,height: 2,decoration: BoxDecoration(color: s_blk2,borderRadius: BorderRadius.circular(10)),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 35,
                width: double.maxFinite,
                alignment: Alignment.centerLeft,
                //color: Colors.red,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: Container(
                      width: 80,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: t_clr),
                      child: Text(
                        'Popular',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: Container(
                      width: 80,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: s_blk2),
                      child: Text(
                        'Lunch',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: Container(
                      width: 80,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: s_blk2),
                      child: Text(
                        'Breakfast',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ]),
              ),
            ),
            Container(
              width: 100,
              height: 130,
              //color: Colors.red,
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 10, right: 15),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15,right: 15),
                        height: 120,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: s_blk2,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Text(
                                'Chicken Biriyani',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              left: 140,
                              top: 20,
                            ),
                            Positioned(
                              child: Text(
                                'Rs 60',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 180, 180, 180)),
                              ),
                              left: 140,
                              top: 50,
                            ),
                            Positioned(
                              child: Image.asset('img/biriyani.png'),
                            ),
                            Positioned(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Book now',style: TextStyle(color: Colors.black),),
                                style: ElevatedButton.styleFrom(
                                    primary: t_clr,
                                    fixedSize: const Size(100, 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                              ),
                              left: 180,
                              top: 65,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15,right: 15),
                        height: 120,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: s_blk2,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Text(
                                'Chappati',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              left: 140,
                              top: 20,
                            ),
                            Positioned(
                              child: Text(
                                'Rs 12 per Nos ',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 180, 180, 180)),
                              ),
                              left: 140,
                              top: 50,
                            ),
                            Positioned(
                              top: 8,left: 8,
                              child: Image.asset('img/chapati.png',width: 100,),
                            ),
                            Positioned(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Book now',style: TextStyle(color: Colors.black),),
                                style: ElevatedButton.styleFrom(
                                    primary: t_clr,
                                    fixedSize: const Size(100, 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                              ),
                              left: 180,
                              top: 65,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15,right: 15),
                        height: 120,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: s_blk2,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Text(
                                'Meals',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              left: 140,
                              top: 20,
                            ),
                            Positioned(
                              child: Text(
                                'Rs 22',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 180, 180, 180)),
                              ),
                              left: 140,
                              top: 50,
                            ),
                            Positioned(
                              child: Image.asset('img/meals.png',width: 100,),
                              top: 8,left: 8,
                            ),
                            Positioned(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Book now',style: TextStyle(color: Colors.black),),
                                style: ElevatedButton.styleFrom(
                                    primary: t_clr,
                                    fixedSize: const Size(100, 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                              ),
                              left: 180,
                              top: 65,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              // color: Colors.green,
              padding: EdgeInsets.only(left: 25),
              // width: 30,
              height: 20,
              child: Row(
                children: [
                  Text(
                    'Most ordered food',
                    style: TextStyle(fontSize: 15, color: t_clr),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: size.width * .5,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: s_blk2,
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
                              color: s_blk2),
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
                                  color: s_blk,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Text(
                                    'Dosa',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: t_clr),
                                  ),
                                  Text(
                                    'Rs 12.0',
                                    style: TextStyle(color: Colors.white),
                                  )
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
                              color: s_blk2),
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
                                  color: s_blk,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Text(
                                    'Dosa',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: t_clr,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Rs 12.0',
                                    style: TextStyle(color: Colors.white),
                                  )
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
                              color: s_blk2),
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
                                  color: s_blk,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Text(
                                    'Dosa',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: t_clr,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Rs 12.0',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                              ),
                            )
                          ]),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 25, right: 15),
                        color: Colors.transparent,
                        elevation: 300,
                        child: Container(
                          width: 120,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: s_blk2),
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
                                  color: s_blk,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Text(
                                    'Dosa',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: t_clr,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Rs 12.0',
                                    style: TextStyle(color: Colors.white),
                                  )
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
