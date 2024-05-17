import 'package:flutter/material.dart';
import 'package:jokes/config/api_client.dart';
import 'package:provider/provider.dart';

class DataWrapper extends StatelessWidget {
  final Widget child;

  const DataWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => ApiClient(baseUrl: "https://api.chucknorris.io/"),
        ),
      ],
      child: child,
    );
  }
}
