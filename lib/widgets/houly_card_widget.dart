import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HourlyCard extends StatelessWidget {
  const HourlyCard({
    super.key,
    required this.index,
    required this.svg,
    required this.temperature,
    required this.precipitationProbability,
    required this.time,
  });

  final String svg;
  final double temperature;
  final int precipitationProbability;
  final int index;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(20, -20),
              child: SvgPicture.asset(
                "assets/weather_icons/$svg",
                width: 80,
                height: 80,
              ),
            ),
            Text(
              time,
              style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            Row(
              children: [
                Text(
                  temperature.toString(),
                  style: Theme.of(context).textTheme.headlineMedium?.apply(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeightDelta: 3,
                      ),
                ),
                Transform.translate(
                  offset: const Offset(0, -5),
                  child: Text(
                    "°C",
                    style: Theme.of(context).textTheme.bodyLarge?.apply(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeightDelta: 2,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.droplet,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.7),
                  size: 15,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  precipitationProbability.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.7),
                        fontWeightDelta: 2,
                      ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "%",
                  style: Theme.of(context).textTheme.bodySmall?.apply(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.7),
                        fontWeightDelta: 2,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
