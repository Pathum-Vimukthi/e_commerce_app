import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> offers = [
    "https://img-ik.cars.co.za/news-site-za/images/2023/05/m3-cs-1.jpg",
    "https://cdn.wallpapersafari.com/13/11/5xf2JW.jpg",
    "https://images.unsplash.com/photo-1568844293986-8d0400bd4745?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Ym13JTIwY2Fyc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    "https://cdn.bmwblog.com/wp-content/uploads/2017/02/E32-BMW-750iL-images-01.jpg",
    "https://images.pexels.com/photos/100653/pexels-photo-100653.jpeg?cs=srgb&dl=pexels-mike-bird-100653.jpg&fm=jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  Icon(
                    Icons.search,
                    size: 30,
                  )
                ],
              ),
              const CustomText(
                text: "Hello Kamal",
                fontSize: 22,
              ),
              CustomText(
                text: "Let's start shopping",
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
              const SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(height: 150.0, autoPlay: true),
                items: offers.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(i), fit: BoxFit.cover)),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
