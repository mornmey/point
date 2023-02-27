import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:horpao_point/config/colors.dart';

class SlideShow extends StatefulWidget {
  const SlideShow({Key? key}) : super(key: key);

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  final List<String> images = [
    "https://i.pinimg.com/600x315/8c/28/00/8c28008ecc46d3206f9060583fef343a.jpg",
    "https://ausgraphics.net/wp-content/uploads/2020/02/logo-finance.jpg",
    "https://www.logodesign.net/logo-new/building-on-crescent-4303ld.png",
    "https://www.logodesign.net/logo/crossed-steel-pillars-2472ld.png",
    "https://www.codester.com/static/uploads/items/000/019/19781/preview-xl.jpg",
    "https://www.logodesign.net/logo-new/line-art-triangle-forming-letter-a-shape-5087ld.png?nwm=1&nws=1&industry=shape",
  ];
  int currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var imageAsset in images) {
        precacheImage(NetworkImage(imageAsset), context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: 2.5,
            enlargeCenterPage: true,
            onPageChanged: (index, _) => setState(() => currentIndex = index),
          ),
          itemBuilder: (BuildContext context, index, _) {
            return Image.network(
              images[index],
              fit: BoxFit.cover,
              width: double.infinity,
            );
          },
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DotsIndicator(
            dotsCount: images.length,
            position: currentIndex.toDouble(),
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.grey.withOpacity(0.5),
              activeColor: AppColorSets.backgroundBlueColor,
            ),
          ),
        ),
      ],
    );
  }
}
