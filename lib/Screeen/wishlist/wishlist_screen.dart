import 'package:client/Screeen/cart/cart_widget.dart';
import 'package:client/Screeen/wishlist/wishlish_widget.dart';
import 'package:client/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../Widgets/back_widget.dart';
import '../../services/global_methods.dart';
import '../../services/utils.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "/WishlistScreen";

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackWidget(),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Wishlist (2)',
          color: color,
          isTitle: true,
          textSize: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {
              GlobalMethods.WarningDialog(
                  title: "Empty your Wishlist?",
                  subtitle: "Are you sure?",
                  fct: (){

                  },
                  context: context
              );
            },
            icon: Icon(IconlyBroken.delete, color: color),
          ),
        ],
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        // mainAxisSpacing: 16,
        // crossAxisSpacing: 20,
        itemBuilder: (context, index) {
          return const WishlistWidget();
        },
      ),
    );
  }
}
