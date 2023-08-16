import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/models/car_model.dart';
import 'package:e_commerce_app/screens/product_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> offers = [
    "https://cdn.wallpapersafari.com/13/11/5xf2JW.jpg",
    "https://cdn.wallpapersafari.com/13/11/5xf2JW.jpg",
    "https://images.unsplash.com/photo-1568844293986-8d0400bd4745?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Ym13JTIwY2Fyc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    "https://cdn.bmwblog.com/wp-content/uploads/2017/02/E32-BMW-750iL-images-01.jpg",
    "https://images.pexels.com/photos/100653/pexels-photo-100653.jpeg?cs=srgb&dl=pexels-mike-bird-100653.jpg&fm=jpg"
  ];
  List<Car> cars = [
    Car(
      description:
          "The BMW 3 Series is a line of compact executive cars manufactured by the German automaker BMW since May 1975. It is the successor to the 02 Series and has been produced in seven generations.",
      id: 100,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuhkA7vs7Hzm84rzG6KRCGwJzmA-cAAINHoYicjpVW-8xIMZgR",
      name: "BMW 3",
      price: 545788,
      type: "BMW 3 Series",
    ),
    Car(
      description:
          "The Ford Mustang is an American car manufactured by Ford. It was originally based on the platform of the second-generation North American Ford Falcon, a compact car.",
      id: 102,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOwehZrbM_f2c5ZAEUEGSwr4yxj9JklcmdRkMUZrlj5bGDl1lm",
      name: "Ford Mustang",
      price: 652500,
      type: "Sports Car",
    ),
    Car(
      description:
          "The BMW 7 Series is a full-size luxury sedan manufactured and marketed by the German automaker BMW since 1977. It is the successor to the BMW E3 sedan and is now in its seventh generation. The 7 Series is BMW's flagship car and is only available in a sedan bodystyle.",
      id: 103,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUmizNn6z8kPPsKjd6wzpv4OR6sqWWuA89F2oOENO1NtUe9t9U",
      name: "BMW 7",
      price: 379900,
      type: "BMW 7 Series",
    ),
    Car(
      description:
          "The BMW X1 is a line of cars produced by German marque BMW since 2009. It is in the subcompact luxury crossover class, and the first-generation X1 was based on the E90 3 Series and offered rear-wheel drive layout as standard.",
      id: 104,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUmizNn6z8kPPsKjd6wzpv4OR6sqWWuA89F2oOENO1NtUe9t9U",
      name: "BMW X1",
      price: 718750,
      type: "BMW X1",
    ),
    Car(
      description:
          "The Honda Civic is a line of cars manufactured by Honda. Originally a subcompact, the Civic has gone through several generational changes, becoming both larger and more upscale.",
      id: 105,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUmizNn6z8kPPsKjd6wzpv4OR6sqWWuA89F2oOENO1NtUe9t9U",
      name: "Honda Civic",
      price: 295500,
      type: "Compact Car",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cars.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      childAspectRatio: 0.95),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                      car: cars[index],
                                    )));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              Image.network(
                                cars[index].image,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: cars[index].name,
                                      fontSize: 15,
                                      textOverFlow: TextOverflow.ellipsis,
                                    ),
                                    CustomText(
                                      text: "\$ ${cars[index].price}",
                                      fontSize: 13,
                                      textOverFlow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
