import 'package:card_swiper/card_swiper.dart';
import 'package:client/consts/consts.dart';
import 'package:client/services/global_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../Widgets/feed_items.dart';
import '../Widgets/on_sale_widget.dart';
import '../Widgets/text_widget.dart';
import '../inner_screens/feeds_screen.dart';
import '../inner_screens/on_sale_screen.dart';
import '../provider/dark_theme_provider.dart';
import '../services/utils.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen ({Key? key}): super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final Color color=Utils(context).color;
    final themeState = Utils(context).getTheme;

    Size size = utils.getScreenSize;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.33,
                  child:Swiper(
                    itemBuilder: (BuildContext, int index){
                      return Image.asset(
                        Constss.offerImage[index],
                        fit: BoxFit.fill,);

                    },
                    autoplay: true,
                    itemCount: Constss.offerImage.length,
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)
                    ),
                    // control: const SwiperControl(color: Colors.black),


                  )
              ),
              const SizedBox(
                height: 6,
              ),
              TextButton(
                onPressed: () {
                  GlobalMethods.navigateTo(
                      ctx: context,
                      routeName: OnSaleScreen.routeName);
                },
                child: TextWidget(
                  text: 'View all',
                  maxLines: 1,
                  color: Colors.blue,
                  textSize: 20,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Row(
                      children: [
                        TextWidget(text: 'Onsale'.toUpperCase(),
                          color: Colors.red,
                          textSize: 22, isTitle:
                          true,),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          IconlyLight.discount,
                          color: Colors.red,

                        )
                        ]

                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: size.height * 0.24,
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return OnSaleWidget();
                          }),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Our products',
                      color: color,
                      textSize: 22,
                      isTitle: true,
                    ),
                    TextButton(
                        onPressed: (){
                          GlobalMethods.navigateTo(
                              ctx: context,
                              routeName: FeedsScreen.routeName);
                        },
                        child: TextWidget(
                          text: 'Browse all',
                          maxLines: 1,
                          color: Colors.blue,
                          textSize: 20,
                    )
                    )
                    ]
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                crossAxisCount: 2,
                 padding: EdgeInsets.zero,
                 // crossAxisSpacing: 10,
                 childAspectRatio: size.width / (size.height*0.59),
                children: List.generate(4, (index){
                    return  FeedsWidget();
                }),

              ),
            ],
          ),
        )
    );
  }
}