import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.index}) : super(key: key);
  final int index;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,height: 100,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/gojo.png'
                      ),
                  fit: BoxFit.contain),
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.grey)]),
        ),
      ],
    );
  }
}
