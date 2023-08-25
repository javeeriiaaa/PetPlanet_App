import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_planet/utils/quotes.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:pet_planet/widgets/safewebview.dart';

class CustomCarouel extends StatelessWidget {
  const CustomCarouel({Key? key}) : super(key: key);

  // void navigateToRoute(BuildContext context, Widget route) {
  //   Navigator.push(context, CupertinoPageRoute(builder: (context) => route));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: List.generate(
              imageSliders.length,
                  (index) => Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                    ),
                    // child: InkWell(
                    //   onTap: () {
                    //     if (index == 0) {
                    //       navigateToRoute(
                    //           context,
                    //         SafeWebView(
                    //           url:
                    //           "https://www.helpguide.org/articles/mental-health/mood-boosting-power-of-dogs.htm",),);
                    //     }
                    //     else if (index == 1) {
                    //       navigateToRoute(
                    //         context,
                    //         SafeWebView(
                    //           url:
                    //           "https://newsinhealth.nih.gov/2018/02/power-pets",),);
                    //     }
                    //     else if (index == 2) {
                    //       navigateToRoute(
                    //         context,
                    //         SafeWebView(
                    //           url:
                    //           "https://www.theguardian.com/lifeandstyle/2023/feb/17/why-owning-a-pet-is-good-for-body-and-mind",),);
                    //     }
                    //     else {
                    //       navigateToRoute(
                    //         context,
                    //         SafeWebView(
                    //           url:
                    //           "https://www.transitionslifecare.org/2020/05/27/the-importance-of-pets-in-our-lives/",),);
                    //     }
                    //   },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: NetworkImage(
                                imageSliders[index],
                              ))),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              Colors.teal.withOpacity(0.3),
                              Colors.transparent,
                            ]),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8, left: 8),
                              child: Text(
                                articleTitle[index],
                                style: TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
      );
  }
}
