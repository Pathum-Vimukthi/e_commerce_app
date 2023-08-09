import 'package:e_commerce_app/components/custom_buttons/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/models/car_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Car car;
  const ProductDetails({super.key, required this.car});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButton(),
                  Image.network(widget.car.image),
                  CustomText(text: widget.car.name),
                  CustomText(
                    text: "\$ ${widget.car.price}",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  Text(
                    widget.car.description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                    size: size,
                    text: "Add to Cart",
                    colors: [Colors.amber.shade500, Colors.amber.shade800],
                    onTap: () {}),
              )
            ],
          )),
    ));
  }
}
