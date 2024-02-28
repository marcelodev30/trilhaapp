import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentIndicatorPage extends StatefulWidget {
  const PercentIndicatorPage({super.key});

  @override
  State<PercentIndicatorPage> createState() => _PercentIndicatorPageState();
}

class _PercentIndicatorPageState extends State<PercentIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percent Indicator'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircularPercentIndicator(
              radius: 130.0,
              animation: true,
              animationDuration: 2200,
              lineWidth: 15.0,
              percent: 0.5,
              center: const Text(
                "50 hours",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.indigo.shade50,
              progressColor: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2500,
                percent: 1,
                center: const Text("100.0%"),
                progressColor: Colors.greenAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
