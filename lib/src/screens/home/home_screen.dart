import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed("settings", pathParameters: {
            "name": "codemagic"
          }, queryParameters: {
            "email": "example@gmail.com",
            "age": "25",
            "place": "India"
          }),
          child: const Text("Go to Settings page"),
        ),
      ),
    );
  }
}
