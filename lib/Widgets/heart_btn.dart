
  import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class HeartBTN extends StatelessWidget {
    const HeartBTN({super.key});
  
    @override
    Widget build(BuildContext context) {
      final Color color=Utils(context).color;
      return GestureDetector(
        onTap: () {
          print('Add to wishlist');
        },
        child: Icon(
          IconlyLight.heart,
          size: 22,
          color: color,
        ),

      );
    }
  }
  