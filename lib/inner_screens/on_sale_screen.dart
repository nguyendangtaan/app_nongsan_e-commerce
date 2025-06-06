import 'package:client/Widgets/back_widget.dart';
import 'package:client/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../Widgets/on_sale_widget.dart';
import '../services/utils.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = '/OnSaleScreen';

  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isEmpty=true;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading:  const BackWidget(),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'On Sale',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: _isEmpty?
      Center(
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset('assets/images/box.png'),
              ),
              Text('No products on sale yet!, \n come back later',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: color,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        )

        ,): GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.zero,
        childAspectRatio: size.width / (size.height * 0.45),
        children: List.generate(16, (index) {
          return const OnSaleWidget();
        }),
      ),
    );
  }
}
