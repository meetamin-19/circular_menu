import 'package:circular_menu/card_widget.dart';
import 'package:circular_menu/detail_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleAnimation(),

      // routes: {
      //   '/details': (context) => DetailsPage()
      // },
      onGenerateRoute: (route) => onGenerateRoute(route),
    );


    }

  static Route onGenerateRoute(RouteSettings settings){
    switch (settings.name){
      case '/details' :
        return SizeRoute(page: DetailsPage(),settings:settings);
      default :
        return SizeRoute(page: MyApp(), settings: settings);
    }
  }
}

class SampleAnimation extends StatefulWidget {
  const SampleAnimation({Key? key}) : super(key: key);

  @override
  State<SampleAnimation> createState() => _SampleAnimationState();
}

int index = 0;


class _SampleAnimationState extends State<SampleAnimation> {
  final FixedExtentScrollController _scrollController =
  FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.black,
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
              child: RotatedBox(
                quarterTurns: -1,
                child: Center(
                  child: ListWheelScrollView.useDelegate(
                      physics: const FixedExtentScrollPhysics(),
                      // diameterRatio: 1.5,
                      offAxisFraction: 0.8,
                      squeeze: 0.4,
                      itemExtent: 100,
                      // overAndUnderCenterOpacity: .3,
                      useMagnifier: false,
                      onSelectedItemChanged: (x) {
                        setState(() {
                          index = x;
                        });
                      },
                      controller: _scrollController,
                      childDelegate: ListWheelChildLoopingListDelegate(
                          children: List<Widget>.generate(
                              5, (index) => CardWidget(index: index)))),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildListView(index),
                )
            )
          ],
        ));
  }

  ListView buildListView(int ind) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            // leading: const Icon(Icons.list,color: Colors.black,),
            title: const Text("Selected Index"),
            leading: SizedBox(child: Image.asset('assets/gojo.png',),
              width: 70,),
            subtitle: Text('$ind'),
            onTap: () {
              gotoDetails();
            },
          ),
        );
      },
    );
  }
  void gotoDetails() async {
     Navigator.pushNamed(context, '/details',arguments: index);
  }

}

class SizeRoute extends PageRouteBuilder {
  final Widget page;
  // RouteSettings? setting;
  SizeRoute({required this.page, RouteSettings? settings})
      : super(
    settings: settings,
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Align(
          // child: Transition,
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        ),
  );

}
