import 'package:flutter/material.dart';

class HealthBar extends StatefulWidget {
  final int currentHp;
  final int maxHp;

  const HealthBar({super.key, required this.currentHp, required this.maxHp});

  @override
  State<HealthBar> createState() => HealthBarState();
}

class HealthBarState extends State<HealthBar> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      value: 1,
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  _fixHealthController() {
    final actualValue = (controller.value * 100).round();
    final expectedValue = (widget.currentHp / widget.maxHp * 100).round();
    if (actualValue == expectedValue) {
      controller.stop();
    } else if (actualValue > expectedValue) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    _fixHealthController();
    return LinearProgressIndicator(
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
      minHeight: 8,
      value: controller.value,
      semanticsLabel: 'Health Bar',
    );
  }
}
