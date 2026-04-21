import 'package:flutter/material.dart';

import '../../../core/routing/routes_names.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  const HomeScreen({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body:  Center(
        child: Column(
          children: [
            Text('Welcome $name to your Home Screen!'),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, RoutesNames.product);
            }, child: Text("go to product screen"))
          ],
        ),
      ),
    );
  }
}