import 'package:client/Widgets/price_widget.dart';
import 'package:client/Widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';
import 'heart_btn.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    final size = Utils(context).getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    FancyShimmerImage(
                      imageUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
                      width: size.width*0.22,
                      height: size.width * 0.22,
                      boxFit: BoxFit.fill,
                    ),
                    Column(

                      children: [
                        TextWidget(
                          text: '1KG',
                          color: color,
                          textSize: 22,
                          isTitle: true,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('Add to cart');
                              },
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),

                            ),
                            HeartBTN(),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
                const PriceWidget(),
                const SizedBox(height: 5),
                TextWidget(text: 'Product title',
                    color: color,
                    textSize: 16,
                    isTitle: true),
                const SizedBox(height: 5),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
