import 'package:doctor_appointment/Signin/create_account.dart';
import 'package:flutter/material.dart';

class OnbaordingScreen extends StatefulWidget {
  const OnbaordingScreen({super.key});

  @override
  State<OnbaordingScreen> createState() => _OnbaordingScreenState();
}

class _OnbaordingScreenState extends State<OnbaordingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              controller: _pageController,
              children: const [
                CreatePage(
                  image: 'assets/png/img onboard.png',
                  title: "Meet Doctor Online",
                  text:
                      'Connect with Specialized Doctor Online for \nConvenient and Comprehensive Medical \nConsultations.',
                  color: Colors.black,
                  textcolor: Colors.white30,
                ),
                CreatePage(
                  image: 'assets/png/img onboard2.png',
                  title: "Conncet with Specialists",
                  text:
                      'Connect with Specialized Doctor Online for \nConvenient and Comprehensive Medical \nConsultations.',
                  color: Colors.black,
                  textcolor: Colors.white30,
                ),
                CreatePage(
                  image: 'assets/png/img onboard3.png',
                  title: "Thousand of Online Specialists",
                  text:
                      'Explore a Vast Array of Online Medical \nSpecialists.Offering an Extensive Range of \nExpertise. Tailored to your Healthcare Needs.',
                  color: Colors.black,
                  textcolor: Colors.white30,
                  // index: 0,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    if (currentIndex == 0) {
                      _pageController.jumpToPage(1);
                    } else if (currentIndex == 1) {
                      _pageController.jumpToPage(2);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccount(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: const Color.fromARGB(255, 8, 48, 81),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAccount(),
                      ),
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Color.fromARGB(255, 11, 65, 110),
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: _buildIndicator(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  //Extra Widgets

  //Create the indicator decorations widget
  Widget _activeindicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 10,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 8, 48, 81),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _inactiveindicator(bool isInActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isInActive ? 20 : 10,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

//Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_activeindicator(true));
      } else {
        indicators.add(_inactiveindicator(false));
      }
    }

    return indicators;
  }
}

class CreatePage extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final Color color;
  final Color textcolor;
  const CreatePage({
    super.key,
    required this.image,
    required this.title,
    required this.text,
    required this.color,
    required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 480,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
