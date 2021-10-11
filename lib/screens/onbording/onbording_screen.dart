import 'package:eazeal/screens/onbording/onbording.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  _OnbordingScreenState createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  late PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              if (currentPage != onbordings.length - 1)
                Align(
                  alignment: Alignment.topRight,
                  child: _buildSkipButton(onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                  }),
                ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints.expand(height: 500),
                child: PageView.builder(
                  controller: _pageController,
                  // onPageChanged: (int page) {
                  // setState(() {
                  //     currentPage = page;
                  // });
                  // },
                  onPageChanged: (int page) {
                    print('page $page');

                    _pageController.animateToPage(
                      page,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                    setState(() => setState(() => currentPage = page));
                  },
                  allowImplicitScrolling: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: onbordings.length,
                  pageSnapping: true,
                  itemBuilder: (context, index) {
                    Onbording onbording = onbordings[currentPage];
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            onbording.imagePath,
                            width: 301,
                            height: 132,
                          ),
                          const SizedBox(height: 30),
                          Text(
                            onbording.title,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          const SizedBox(height: 30),
                          Text(
                            onbording.summary,
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onbordings.length,
                  (index) => _buildIndicator(index, onTap: () {
                    print("Index: $index");
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                    setState(() {
                      currentPage = index;
                    });
                  }),
                ),
              ),
              const SizedBox(height: 30),
              if (currentPage == onbordings.length - 1)
                MaterialButton(
                  height: 50,
                  minWidth: 200,
                  color: const Color(0xff506281),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  TextButton _buildSkipButton({required void Function()? onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: const Text("Skip", style: TextStyle(fontSize: 16)),
    );
  }

  Widget _buildIndicator(int index, {required void Function() onTap}) {
    bool isCurrent = currentPage == index;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 600),
        curve: Curves.ease,
        height: 10,
        width: isCurrent ? 20 : 10,
        margin: const EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isCurrent ? const Color(0xff506281) : const Color(0xffD3D3D3),
        ),
      ),
    );
  }
}
