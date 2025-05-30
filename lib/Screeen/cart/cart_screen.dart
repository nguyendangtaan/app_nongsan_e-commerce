

import 'package:client/Screeen/cart/cart_widget.dart';
import 'package:client/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../services/global_methods.dart';
import '../../services/utils.dart';
import '../../Widgets/empty_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    bool _isEmpty = true;
    return _isEmpty? const EmptyScreen(
      title: 'Your cart is empty',
      subtitle: 'Add some products to your cart',
      buttonText:'Shop now' ,
      imagePath:'assets/images/cart.png' ,
    ): Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Cart (2)',
            color: color,
            textSize: 22,
            isTitle: true,),
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethods.WarningDialog(
                    title: "Empty your cart?",
                    subtitle: "Are you sure?",
                    fct: (){

                    },
                    context: context
                );
              },
              icon: Icon(IconlyBroken.delete),
              color: color,
            )
          ],
        ),
        body: Column(
          children: [
            _checkout(ctx: context),

            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, index) {
                    return CartWidget();
                  }
              ),
            ),
          ],
        )
    );
  }

  Widget _checkout({required BuildContext ctx}) {
    final Color color = Utils(ctx).color;
    Size size = Utils(ctx).getScreenSize;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      // color: ,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
            children: [
              Material(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget(
                        text: 'Buy Now',
                        color: Colors.white,
                        textSize: 20,
                      ),
                    ),
                  )
              ),
             const Spacer(),
              FittedBox(
                child: TextWidget(
                    text: 'total: \$0.295',
                    color: color,
                    textSize: 18,
                isTitle: true,),
              )
            ]
        ),
      ),
    );
  }
}