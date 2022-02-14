import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);

 late final index;
  @override
  Widget build(BuildContext context) {
    index = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('$index'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height *0.4,
        color: Colors.grey,
        child: Image.asset('assets/gojo.png',fit: BoxFit.cover,),
      ),
    );
  }
}
