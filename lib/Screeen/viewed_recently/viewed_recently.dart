import 'package:client/Screeen/viewed_recently/viewed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../../Widgets/back_widget.dart';
import '../../Widgets/empty_screen.dart';
import '../../services/global_methods.dart';
import '../../services/utils.dart';
import '../../widgets/text_widget.dart';


class ViewedRecentlyScreen extends StatefulWidget {
  static const routeName = '/ViewedRecentlyScreen';

  const ViewedRecentlyScreen({Key? key}) : super(key: key);

  @override
  _ViewedRecentlyScreenState createState() => _ViewedRecentlyScreenState();
}

class _ViewedRecentlyScreenState extends State<ViewedRecentlyScreen> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    bool _isEmpty = true;
    // Size size = Utils(context).getScreenSize;
    if (_isEmpty == true) {
      return const EmptyScreen (
        title: 'Your history is empty',
        subtitle: 'No products viewed yet',
        buttonText: 'Shop now',
        imagePath: 'assets/images/history.png',
      );
    }
    else {
     return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethods.WarningDialog(
                    title: 'Empty your history?',
                    subtitle: 'Are you sure?',
                    fct: () {},
                    context: context);
              },
              icon: Icon(
                IconlyBroken.delete,
                color: color,
              ),
            )
          ],
          leading: const BackWidget(),
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: TextWidget(
            text: 'History',
            color: color,
            textSize: 24.0,
          ),
          backgroundColor:
          Theme
              .of(context)
              .scaffoldBackgroundColor
              .withOpacity(0.9),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: ViewedRecentlyWidget(),
              );
            }),
      );
    }
  }
}
