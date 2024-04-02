import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:milckoapk/widgets/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
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

class _HomeScreenState extends State<HomeScreen> {

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
    // TODO: implement initState
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
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              const SizedBox(width: 10,),
              // Hello Humans Greetings
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Hello Humans!',
                  style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500,),),
                  ShaderMask(shaderCallback: (bounds) => 
                  LinearGradient(
                    colors: [
                    Color(0xFFFFA400),
                    Colors.black.withOpacity(0.7),
                  ]).createShader(
                    bounds,
                  ),
                  child: const Text('Get The Right One For The',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                  ),
                  ShaderMask(shaderCallback: (bounds) => 
                  LinearGradient(colors: [
                    Color(0xFFFFBF4D),
                    Colors.black.withOpacity(0.4),
                  ]).createShader(
                    bounds,
                  ),
                  child: const Text('Better Health',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                  ),
                  
                ],
              ),
              SizedBox(width: 40,),
              // location Icon Clickable
              Image.asset('lib/images/pin.png',height: 20,width: 20,),
              const Text('LNCT Canteen')
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                      hintText: 'Search for better Health',
                      prefixIcon: const Icon(Icons.search,color: Colors.yellow,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(),
                      )
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                const Icon(Icons.shopping_bag_outlined,color: Colors.yellow,),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Category',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const SizedBox(width: 15,),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 60,width: 60,
                    decoration: BoxDecoration(color: Color.fromARGB(255, 175, 223, 246),borderRadius: BorderRadius.circular(20)),),
                  Image.asset('lib/images/first_category.png',width: 50,height: 50,),
                ],
              ),
              const SizedBox(width: 15,),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 60,width: 60,
                    decoration: BoxDecoration(color: Color.fromARGB(255, 198, 229, 244),borderRadius: BorderRadius.circular(20)),),
                  Image.asset('lib/images/second_category.png',width: 50,height: 50,),
                ],
              ),
              const SizedBox(width: 15,),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 60,width: 60,
                    decoration: BoxDecoration(color: Color.fromARGB(255, 249, 193, 211),borderRadius: BorderRadius.circular(20)),),
                  Image.asset('lib/images/third_category.png',width: 50,height: 50,),
                ],
              ),
              const SizedBox(width: 15,),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 60,width: 60,
                    decoration: BoxDecoration(color: Color.fromARGB(255, 158, 188, 202),borderRadius: BorderRadius.circular(20)),),
                  Image.asset('lib/images/fourth_category.png',width: 50,height: 50,),
                ],
              ),
              const SizedBox(width: 15,),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 60,width: 60,
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 215, 154, 174),borderRadius: BorderRadius.circular(20)),),
                  Image.asset('lib/images/fifth_category.png',width: 50,height: 50,),
                ],
              ),
            ]
          ),
          const SizedBox(height: 30,),
          Container(
            height: 200,
            width: 500,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey),
            child: Center(child: const Text('BUY IT NOW\n   IMAGE',style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              const SizedBox(width: 20,),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 236, 136, 169)),
                  ),
                  Container(
                    height: 180,
                    width: 140,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                  ),
                  Column(
                    children: [
                      Image.asset('lib/images/first_category.png'),
                      Text('Cow Milk'),
                      Text('1000gm/1 litre'),
                      Row(
                        children: [
                          RichText(text: const TextSpan(
                            children: [
                              TextSpan(text: '55 Rs.\n',style: TextStyle(color: Colors.black)),
                               TextSpan(text: '60 Rs. ',style: TextStyle(color: Colors.black,decoration: TextDecoration.lineThrough))
                            ]
                          )),
                          ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 150, 235, 153)),child: Text('Grab It'),)
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(width: 40,),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 236, 136, 169)),
                  ),
                  Container(
                    height: 180,
                    width: 140,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                  ),
                  Column(
                    children: [
                      Image.asset('lib/images/second_category.png'),
                      Text('Cow Milk'),
                      Text('1000gm/1 litre'),
                      Row(
                        children: [
                          RichText(text: const TextSpan(
                            children: [
                              TextSpan(text: '55 Rs.\n',style: TextStyle(color: Colors.black)),
                               TextSpan(text: '60 Rs. ',style: TextStyle(color: Colors.black,decoration: TextDecoration.lineThrough))
                            ]
                          )),
                          ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 150, 235, 153)),child: Text('Grab It'),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(255, 248, 239, 157)),
              child: Center(child: const Text('One More Image\n Subscription Plan',style: TextStyle(fontWeight: FontWeight.bold),)),
            ),
          )
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
