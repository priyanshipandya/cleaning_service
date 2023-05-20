import 'package:cleaning_service/components/ordered_bill.dart';
import 'package:cleaning_service/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/selectable_services.dart';
import 'ordered.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  double scrolledPixels = 0.0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {
        scrolledPixels = scrollController.position.pixels;
      });
      print(scrolledPixels);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      ///why dont you use simple ap bar
      ///summary and pay vache aavi jase me IOS ma
      ///centerr title false hase to pn ? ofc
      ///ios ma bydefault j appbar no content vache j aave che -ok
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPersistentHeader(
            delegate: MyPersistentHeaderDelegate(
              minHeight: 50,
              maxHeight: 50,
              child: Container(
                //su karu e k//git upr upload karyu ?
                color:  Colors.white.withOpacity(scrolledPixels/50 > 1 ? 1 : scrolledPixels/50),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).maybePop();
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      "Summary and Pay",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: cColor.cOrange,
                        child: SvgPicture.asset(
                          "asset/vectors/avatar.svg",
                          height: 80,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            "Markus Horizon",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white10),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: cColor.cOrange,
                                  ),
                                  Text("5.0"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("asset/images/juice.png", height: 22),
                            const Padding(
                              padding: EdgeInsets.only(left: 3.0),
                              child: Text(
                                "Additional Services",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Customize",
                          style: TextStyle(
                              fontSize: 15,
                              color: cColor.cOrange,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                  SelectableServices(),
                  OrderBill(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(cColor.cOrange),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderPlaced(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Place Order"),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text("\$25.30"),
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                border: Border(
                                  left:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  MyPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant MyPersistentHeaderDelegate oldDelegate) {
    return false;
    // return maxHeight != oldDelegate.maxHeight ||
    //     minHeight != oldDelegate.minHeight ||
    //     child != oldDelegate.child;
  }
}
