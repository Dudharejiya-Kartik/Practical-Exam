import 'package:flutter/material.dart';

import '../../utills/routes.dart';
import '../../utills/product.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double discount = 0.0;
  double totalPrice = 0.0;

  calculateBill() {
    totalPrice = 0.0;
    addToCart.forEach((element) {
      discount = (element['price'] * (element['discount'] ?? 0.0)) / 100;
      totalPrice += (element['price'] - discount) * element['qty'];
    });
  }

  @override
  void initState() {
    super.initState();
    calculateBill();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: h * 0.033,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  GlobalRoutes.home_page, (route) => false);
            },
            icon: const Icon(Icons.home_filled),
          ),
          SizedBox(
            width: w * 0.025,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: (addToCart.isEmpty)
            ? Center(
                child: Image.network(
                    "https://bofrike.in/wp-content/uploads/2021/08/no-product.png"),
              )
            : Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...addToCart
                              .map(
                                (e) => Slidable(
                                  endActionPane: ActionPane(
                                    motion: const BehindMotion(),
                                    children: [
                                      SlidableAction(
                                        borderRadius: BorderRadius.circular(20),
                                        icon: Icons.share_outlined,
                                        onPressed: (context) {},
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SlidableAction(
                                        borderRadius: BorderRadius.circular(20),
                                        icon: Icons.delete,
                                        foregroundColor: Colors.red,
                                        onPressed: (context) {
                                          setState(() {
                                            addToCart.remove(e);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    height: h * 0.12,
                                    width: w,
                                    margin: const EdgeInsets.all(8),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(h * 0.01),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            h * 0.01),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          e['home_image']),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      e['name'],
                                                      style: TextStyle(
                                                        fontSize: h * 0.015,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: h * 0.03,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Size - M",
                                                          style: TextStyle(
                                                            fontSize: h * 0.015,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: w * 0.099,
                                                        ),
                                                        Text(
                                                          "color - All",
                                                          style: TextStyle(
                                                            fontSize: h * 0.015,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "\$ ${e['price']}.00",
                                                      style: TextStyle(
                                                        fontSize: h * 0.015,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0xffAA14F0),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: h * 0.025,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              if (e['qty'] <
                                                                  e['stock']) {
                                                                e['qty']++;
                                                              }
                                                              calculateBill();
                                                            });
                                                          },
                                                          child: CircleAvatar(
                                                            radius: w * 0.02,
                                                            backgroundColor:
                                                                Colors.grey
                                                                    .withOpacity(
                                                                        0.3),
                                                            child: const Icon(
                                                                Icons.add,
                                                                size: 10),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: w * 0.009,
                                                        ),
                                                        Text(
                                                          "${e['qty']}",
                                                          style: TextStyle(
                                                            fontSize: h * 0.015,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: w * 0.009,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              if (e['qty'] >
                                                                  1) {
                                                                e['qty']--;
                                                              } else {
                                                                addToCart
                                                                    .remove(e);
                                                              }
                                                              calculateBill();
                                                            });
                                                          },
                                                          child: CircleAvatar(
                                                            radius: w * 0.02,
                                                            backgroundColor:
                                                                Colors.grey
                                                                    .withOpacity(
                                                                        0.2),
                                                            child: const Icon(
                                                              Icons.remove,
                                                              size: 10,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: h * 0.25,
                      width: w,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(h * 0.012),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Selected Item :",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: MediaQuery.of(context)
                                      .textScaler
                                      .scale(15),
                                ),
                              ),
                              Text(
                                "${addToCart.length}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context)
                                      .textScaler
                                      .scale(15),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total price :",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: MediaQuery.of(context)
                                      .textScaler
                                      .scale(15),
                                ),
                              ),
                              Text(
                                "${totalPrice.toString().split('.')[0]}.${totalPrice.toString().split('.')[1][0]}${totalPrice.toString().split('.')[0][1]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context)
                                      .textScaler
                                      .scale(15),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "AllDiscount :",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: MediaQuery.of(context)
                                      .textScaler
                                      .scale(15),
                                ),
                              ),
                              Text(
                                "12.36",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context)
                                      .textScaler
                                      .scale(15),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tax :",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: MediaQuery.of(context)
                                      .textScaler
                                      .scale(15),
                                ),
                              ),
                              Text(
                                "0.0",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context)
                                      .textScaler
                                      .scale(15),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    height: h * 0.075,
                    width: w * 4,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff8e6cef),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: h * 0.025,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
