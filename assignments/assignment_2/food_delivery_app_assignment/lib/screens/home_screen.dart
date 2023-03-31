import 'package:flutter/material.dart';
import 'package:food_delivery_app_assignment/dummy_data.dart';
import 'package:food_delivery_app_assignment/screens/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAdded = false;
  int _cartNo = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Domino\'s Pizza',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: size.width * 0.07),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          cartNo: _cartNo,
                        ),
                      ),
                    ),
                icon: Image.asset('assets/images/cart.png'))
          ],
        ),
        body: ListView.builder(
          itemCount: dummyFoods.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 90,
                        width: size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                dummyFoods[index].itemName,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Text(
                                dummyFoods[index].content,
                                style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  color: const Color(0xFF696969),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                height: size.height * 0.025,
                                width: size.width * 0.38,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/images/starcolor.png'),
                                    Image.asset('assets/images/starcolor.png'),
                                    Image.asset('assets/images/starcolor.png'),
                                    Image.asset('assets/images/starcolor.png'),
                                    Image.asset('assets/images/star.png')
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              height: 90,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  dummyFoods[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                dummyFoods[index].inCart =
                                    !dummyFoods[index].inCart;
                                _isAdded = !_isAdded;
                                if (dummyFoods[index].inCart) {
                                  _cartNo++;
                                } else {
                                  _cartNo--;
                                }
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: dummyFoods[index].inCart
                                          ? Colors.green
                                          : Colors.red),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                dummyFoods[index].inCart ? 'ADDED' : 'ADD',
                                style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    color: dummyFoods[index].inCart
                                        ? Colors.green
                                        : Colors.red),
                              )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
              ],
            ),
          ),
        ));
  }
}
