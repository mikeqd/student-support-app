import 'package:flutter/material.dart';

class TipsTab extends StatefulWidget {
  const TipsTab({super.key});

  @override
  State<TipsTab> createState() => _TipsTabState();
}

class _TipsTabState extends State<TipsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [Text("Welcome to the TIPS tab.")],
      ),
    );
  }
}
