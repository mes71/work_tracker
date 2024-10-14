import 'package:flutter/material.dart';
import 'package:work_tracker/presentation/widgets/half_progress.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HalfCircleProgressBar(progress: 0.6),
    );
  }
}
