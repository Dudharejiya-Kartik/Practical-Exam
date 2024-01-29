import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../utills/product.dart';
import '../../utills/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String category = "all";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://img.freepik.com/premium-photo/fashionable-guy-dressed-black-jacket-jeans-holds-smartphone-sitting-steps-against-old-building-europe_613910-18099.jpg"),
          ),
        ),
        title: Text(
          "E Commerce",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: h * 0.029,
          ),
        ),
        shadowColor: Colors.black,
        elevation: 5,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(GlobalRoutes.cart_page);
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: h * 0.06,
                width: w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: w * 0.065,
                    ),
                    Icon(
                      Icons.search_rounded,
                      size: h * 0.035,
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                        fontSize: h * 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categoris",
                      style: TextStyle(
                        fontSize: h * 0.035,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: h * 0.028,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...Category.map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                category = e;
                                log(category);
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: h * 0.04,
                                  decoration: BoxDecoration(
                                    color: (category == e)
                                          ? Color(0xff2e3759)
                                          : Color(0xfff2f2f2),
                                      borderRadius: BorderRadius.circular(20)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      fontSize: h * 0.018,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Selling...",
                      style: TextStyle(
                        fontSize: h * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: h * 0.028,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...Product.map(
                      (e) => (category == e['category']
                          ? GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    GlobalRoutes.detail_page,
                                    arguments: e);
                              },
                              child: Container(
                                height: h * 0.55,
                                width: w * 0.7,
                                margin: const EdgeInsets.all(12),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: const Color(0xfff2f2f2),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite_border,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: h * 0.005,
                                    ),
                                    SingleChildScrollView(
                                      child: Container(
                                        height: h * 0.35,
                                        width: w,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image:
                                                NetworkImage(e['home_image']),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.01,
                                    ),
                                    Text(
                                      e['name'],
                                      style: TextStyle(
                                        fontSize: h * 0.02,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.001,
                                    ),
                                    Text(
                                      "\$ ${e['price']}.00",
                                      style: TextStyle(
                                        fontSize: h * 0.02,
                                        color: Color(0xffAA14F0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container()),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New In",
                      style: TextStyle(
                        fontSize: h * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: h * 0.028,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      4,
                      (index) => Row(
                        children: [
                          Container(
                            height: h * 0.55,
                            width: w * 0.6,
                            margin: const EdgeInsets.all(12),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Color(0xfff2f2f2),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.005,
                                ),
                                SingleChildScrollView(
                                  child: Container(
                                    height: h * 0.325,
                                    width: w,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            Product[index + 10]['home_image']),
                                        // NetworkImage(Product[index + 5]['thumbnail']),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Text(
                                  Product[index + 10]['name'],
                                  style: TextStyle(
                                    fontSize: h * 0.02,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.001,
                                ),
                                Text(
                                  "\$ ${Product[index + 10]['price']}.00",
                                  style: TextStyle(
                                    fontSize: h * 0.02,
                                    color: Color(0xffAA14F0),
                                    fontWeight: FontWeight.bold,
                                  ),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: h * 0.09,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: GNav(
          gap: 8,
          backgroundColor: Colors.grey.shade200,
          tabBackgroundColor: Colors.grey.shade50,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.favorite_border_outlined,
              text: "Saved",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: Icons.settings,
              text: "Settings",
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
