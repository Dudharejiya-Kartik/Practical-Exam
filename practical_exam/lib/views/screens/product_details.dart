import 'dart:developer';
import 'package:flutter/material.dart';
import '../../utills/product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Detail",
          style: TextStyle(
            color: Colors.black,
            fontSize: h * 0.03,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black,
        actions: [
          Icon(Icons.favorite),
          SizedBox(
            width: w * 0.03,
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...data['all_images']
                          .map(
                            (e) => Container(
                              height: h * 0.33,
                              width: w * 0.8,
                              margin: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(e),
                                  fit: BoxFit.fill,
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
                flex: 0,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['name'],
                            style: TextStyle(
                              fontSize: h * 0.035,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: h * 0.002,
                          ),
                          Text(
                            data['brand'],
                            style: TextStyle(
                              fontSize: h * 0.028,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: h * 0.002,
                          ),
                          Text(
                            "\$ ${data['price']}.00",
                            style: TextStyle(
                              fontSize: h * 0.03,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffAA14F0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.028,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['description'],
                      style: TextStyle(
                        fontSize: h * 0.02,
                        color: Color(0xff7A7A7A),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.025,
                    ),
                    Text(
                      "Shipping & Returns",
                      style: TextStyle(
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Text(
                      "Free standard shipping and free 60-day returns",
                      style: TextStyle(
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Ink(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(h * 0.035),
                ),
                child: InkWell(
                  splashColor: Colors.grey,
                  borderRadius: BorderRadius.circular(h * 0.035),
                  onTap: () {
                    if (!addToCart.contains(data)) {
                      addToCart.add(data);
                    }
                  },
                  child: Container(
                    height: h * 0.06,
                    width: w * 4,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff8e6cef),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: w * 0.06,
                        ),
                        Text(
                          "\$ ${data['price']}.00",
                          style: TextStyle(
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: w * 0.3,
                        ),
                        Text(
                          "Add To Bag",
                          style: TextStyle(
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
