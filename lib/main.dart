import 'package:client/Screeen/auth/forget_pass.dart';
import 'package:client/Screeen/auth/login.dart';
import 'package:client/Screeen/auth/register.dart';
import 'package:client/Screeen/home_screen.dart';
import 'package:client/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'Screeen/btm_bar.dart';
import 'Screeen/viewed_recently/viewed_recently.dart';
import 'Screeen/wishlist/wishlist_screen.dart';
import 'consts/theme_data.dart';
import 'package:provider/provider.dart';
import 'screeen/orders/orders_screen.dart';
import 'inner_screens/feeds_screen.dart';
import 'inner_screens/on_sale_screen.dart';
import 'inner_screens/product_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
    await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter',
                theme: Styles.themeData(themeProvider.getDarkTheme, context),
                home: const LoginScreen(),
                routes: {
                  OnSaleScreen.routeName: (ctx) => const OnSaleScreen(),
                  FeedsScreen.routeName: (ctx) => const FeedsScreen(),
                  ProductDetails.routeName: (ctx) => const ProductDetails(),
                  WishlistScreen.routeName: (ctx) => const WishlistScreen(),
                  OrdersScreen.routeName: (ctx) => const OrdersScreen(),
                  ViewedRecentlyScreen.routeName: (ctx) => const ViewedRecentlyScreen(),
                  RegisterScreen.routeName: (ctx) => const RegisterScreen(),
                  LoginScreen.routeName: (ctx) => const LoginScreen(),
                  ForgetPasswordScreen.routeName: (ctx) => const ForgetPasswordScreen(),
            },
            );
          }),
    );

  }
}


