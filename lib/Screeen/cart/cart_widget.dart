import 'package:client/Widgets/heart_btn.dart';
import 'package:client/inner_screens/product_details.dart';
import 'package:client/services/global_methods.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Widgets/text_widget.dart';
import '../../services/utils.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _quantityTextController.text = '1';
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return GestureDetector(
      onTap: () {
        GlobalMethods.navigateTo(ctx: context, routeName: ProductDetails.routeName);
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: size.width * 0.25,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: FancyShimmerImage(
                        imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Title',
                          color: color,
                          textSize: 20,
                          isTitle: true,
                        ),
                        SizedBox(height: 16.0),

                        SizedBox(
                          width: size.width * 0.3,
                          child: Row(
                            children: [
                              _quantityController(
                                fct: () {
                                  if (_quantityTextController.text == '1') {
                                    return;
                                  } else {
                                    setState(() {
                                      _quantityTextController.text = (int.parse(
                                          _quantityTextController
                                              .text) -
                                          1)
                                          .toString();
                                    });
                                  }

                                },
                                icon: CupertinoIcons.minus,
                                color: Colors.red,
                              ),
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  controller: _quantityTextController,
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.]'),
                                    ),
                                  ],
                                  onChanged: (values) {
                                    setState(() {
                                      if (values.isEmpty) {
                                        _quantityTextController.text = '1';
                                      }
                                    });
                                  },
                                ),
                              ),
                              _quantityController(
                                fct: () {
                                  setState(() {
                                    _quantityTextController.text =(
                                        int.parse(_quantityTextController.text) + 1).toString();
                                  });
                                },
                                icon: CupertinoIcons.plus,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          SizedBox(height: 5),
                          const HeartBTN(),
                          TextWidget(
                            text: '\$0.29',
                            color: color,
                            textSize: 18,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityController({
    required Function fct,
    required IconData icon,
    required Color color,
  }) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                  icon,
                  color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
