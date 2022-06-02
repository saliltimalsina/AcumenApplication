import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/cart/cart_screen.dart';
import 'package:my_app/screens/home/components/constants.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  List<Filter> filters = getFilterList();

  late Filter selectedFilter;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
      // selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 46, left: 15, right: 46),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 8,
                  blurRadius: 12,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover books",
                  style: GoogleFonts.catamaran(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    height: 1,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: buildFilters(),
                  ),
                ),
              ],
            ),
          ),
          // Row(
          //   children: [
          //     RichText(
          //         text: const TextSpan(children: [
          //       // TextSpan(
          //       //     text: 'Discover books',
          //       //     style: TextStyle(
          //       //         color: Colors.black,
          //       //         fontSize: 37,
          //       //         fontWeight: FontWeight.bold)),
          //       TextSpan(text: "🛍️", style: TextStyle(fontSize: 22))
          //     ]))
          //   ],
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.pushNamed(context, CartScreen.routeName);
          //   },
          //   child: Stack(
          //     children: [
          //       Container(
          //         padding: EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(10),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.grey.withOpacity(0.3),
          //                 spreadRadius: 0.1,
          //                 blurRadius: 0.1,
          //                 offset: const Offset(0, 1),
          //               )
          //             ]),
          //         child: const Icon(
          //           Icons.shopping_cart_outlined,
          //           color: Colors.grey,
          //         ),
          //       ),
          //       Positioned(
          //           right: 10,
          //           top: 10,
          //           child: Container(
          //             width: 10,
          //             height: 10,
          //             decoration: BoxDecoration(
          //                 color: Theme.of(context).primaryColor,
          //                 shape: BoxShape.circle),
          //           ))
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  List<Widget> buildFilters() {
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(buildFilter(filters[i]));
    }
    return list;
  }

  Widget buildFilter(Filter item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = item;
        });
      },
      child: Container(
        height: 50,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 30,
                height: 3,
                color: selectedFilter == item
                    ? nPrimaryColor
                    : Color.fromARGB(0, 240, 0, 0),
              ),
            ),
            Center(
              child: Text(
                item.name,
                style: GoogleFonts.catamaran(
                  color: selectedFilter == item
                      ? nPrimaryColor
                      : Color.fromARGB(255, 247, 130, 5),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Filter {
  String name;

  Filter(this.name);
}

List<Filter> getFilterList() {
  return <Filter>[
    Filter("CLASSICS"),
    Filter("NEW"),
    Filter("UPCOMING"),
  ];
}
