import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController _pageController =
  PageController(viewportFraction: 0.55, initialPage: 0);


  final List<Image> images = List.generate(
      10, (index) => Image.asset('assets/images/Card.png'));

  final List<Image> smallImages = List.generate(
      10, (index) => Image.asset('assets/images/Card3.png'));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 351 + 121,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              pageSnapping: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                      value = (1 - (value.abs() * 0.15)).clamp(0.85, 1.1);
                    }

                    return Center(
                      child: Transform.scale(
                        scale: value,
                        child: Container(
                          height: 351,
                          width: 234,
                          margin: const EdgeInsets.only(top: 121),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: images[index].image,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 197),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'Action',
                  style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children:  [
                    Text(
                      'See More',
                      style: TextStyle(
                          color: ColorManager.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_outlined,
                      size: 16,
                      color: ColorManager.yellow,
                    )
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: smallImages.length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return Container(
                  width: 146,
                  margin: EdgeInsets.only(right: index == smallImages.length - 1 ? 0 : 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: smallImages[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}