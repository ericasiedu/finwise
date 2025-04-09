import 'package:finwise/models/on_boarding_data.dart';
import 'package:finwise/screens/start_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    void nextPage() {
      if (currentIndex < item.length - 1) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StartScreen()),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: primaryColor,
                  height: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 22, left: 25, right: 25),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Text(
                          item[currentIndex].title,
                          style: TextStyle(fontSize: 28),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.3,
                  bottom: 0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: lightGreenBg,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(22),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 248,
                                  height: 248,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(124),
                                    color: lightGreen,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Image.asset(
                                    item[currentIndex].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          TextButton(
                            onPressed: nextPage,
                            child: Text(
                              currentIndex == item.length - 1
                                  ? 'Get Started'
                                  : 'Next',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(height: 10),
                          SmoothPageIndicator(
                            controller: _pageController,
                            count: 2,
                            effect: SlideEffect(
                              activeDotColor: primaryColor, // Solid active dot
                              dotColor: Colors.grey, // Hollow inactive dots
                              dotHeight: 10,
                              dotWidth: 10,
                              paintStyle:
                                  PaintingStyle
                                      .stroke, // Border for inactive dots
                              strokeWidth: 2, // Border thickness
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: item.length,
        ),
      ),
    );
  }
}
