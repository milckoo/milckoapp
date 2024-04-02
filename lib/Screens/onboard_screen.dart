import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
//import 'package:flutter/widgets.dart';
import 'package:milckoapk/Screens/map_screeen.dart';
import 'package:milckoapk/providers/location_provider.dart';
import 'package:milckoapk/widgets/constants.dart';
import 'package:provider/provider.dart';
// import 'package:milcko_apk/constants.dart';

class OnBaordScreen extends StatefulWidget {
  const OnBaordScreen({super.key});

  @override
  State<OnBaordScreen> createState() => _OnBaordScreenState();
}

class _OnBaordScreenState extends State<OnBaordScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    const PageContent(
      imageAsset: 'lib/images/enteraddress.png',
      text: 'Set Your Delivery Location',
    ),
    const PageContent(
      imageAsset: 'lib/images/ordermilk.png',
      text: 'Order Fresh Farm Milk From Milcko',
    ),
    const PageContent(
      imageAsset: 'lib/images/deliveryboy.png',
      text: 'Eco Friendly Delivery at your DoorStep',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(Duration(seconds: 3), () {
      if (_currentPage == _pages.length - 1) {
        _controller.jumpToPage(0);
      } else {
        _controller.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
      _startAutoScroll();
    });
  }

  @override
  Widget build(BuildContext context) {

    final locationData = Provider.of<LocationProvider>(context,listen: false);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 100,
              child: PageView(
                controller: _controller,
                children: _pages,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          DotsIndicator(
            dotsCount: _pages.length,
            position: _currentPage.toDouble(),
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              activeColor: Colors.orangeAccent,
            ),
          ),
          const SizedBox(height: 50),
          const Text('Ready to be Healthy and Nature Supportive?',style: TextStyle(color: Colors.grey,fontSize: 15),),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent,),
            onPressed: () async {
              await locationData.getCurrentPosition();
              if(locationData.premissionAllowed == true) {
                Navigator.pushReplacementNamed(context, MapScreen.id);
              }
              else{
                print('PERMISSION NOT ALLOWED');
              }
            },
            child: const Text('Set Delivery Location',style: TextStyle(color: Colors.white),)),
          const SizedBox(height: 40),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  final String imageAsset;
  final String text;

  const PageContent({
    required this.imageAsset,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(imageAsset),
          ),
        Text(
          text,
          style: kPageViewTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
