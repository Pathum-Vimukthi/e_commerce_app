import 'package:e_commerce_app/components/custom_buttons/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/models/car_model.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
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
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const CustomText(
            text: "My Cart",
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(cars[index].image),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: cars[index].name,
                                fontSize: 16,
                              ),
                              CustomText(
                                text: "\$ ${cars[index].price}",
                                fontSize: 16,
                              ),
                            ],
                          ),
                          Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.remove,
                                    size: 15,
                                  ),
                                  Text(
                                    "1",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(
                            text: "Total",
                            fontSize: 18,
                          ),
                          CustomText(
                            text: "\$ 4500000",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      CustomButton(
                          size: size,
                          text: "Buy Now",
                          colors: [
                            Colors.amber.shade500,
                            Colors.amber.shade800
                          ],
                          onTap: () {})
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
