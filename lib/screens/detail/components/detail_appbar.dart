import 'package:flutter/material.dart';
import 'package:my_app/model/Books.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/screens/detail/components/colorpicker.dart';

class DetailAppBar extends StatefulWidget {
  const DetailAppBar({Key? key, required this.Books}) : super(key: key);
  final Books Books;

  @override
  _DetailAppBarState createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  final List<Color> colors = const [
    Color(0xFFE6CFC6),
    Color(0xFFEEDFB5),
    Color(0xFFCAE2C5),
    Color(0XFFBAE6EE),
  ];
  final CarouselController _controller = CarouselController();
  int _currentPage = 0;

  int _currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                  height: 500,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    _currentPage = index;
                  }),
              items: widget.Books.detailUrl
                  .map((e) => Builder(
                      builder: (context) => Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(e),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          )))
                  .toList(),
            ),
          ),
          Positioned(
              bottom: 30,
              left: 180,
              child: Row(
                children: widget.Books.detailUrl
                    .asMap()
                    .entries
                    .map(
                      (entry) => GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(
                                  _currentPage == entry.key ? 0.9 : 0.4)),
                        ),
                      ),
                    )
                    .toList(),
              )),
          Positioned(
              bottom: 30,
              right: 30,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30)),
                height: 175,
                width: 50,
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentColor = index;
                            });
                          },
                          child: ColorPicker(
                              color: colors[index],
                              outerBorder: _currentColor == index),
                        ),
                    separatorBuilder: (_, index) => const SizedBox(
                          height: 3,
                        ),
                    itemCount: colors.length),
              )),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 25,
              right: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                          size: 20,
                        ),
                      )),
                ),
                Container(
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                    size: 20,
                  ),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
