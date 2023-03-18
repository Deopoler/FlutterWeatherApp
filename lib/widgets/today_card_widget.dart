import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class TodayCard extends StatelessWidget {
  const TodayCard(
      {super.key,
      required this.temperature,
      required this.location,
      required this.svg});

  final double temperature;
  final String location;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today",
                        style: Theme.of(context).textTheme.headlineLarge?.apply(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeightDelta: 2),
                      ),
                      Text(
                        DateFormat.MMMEd().format(
                          DateTime.now(),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium?.apply(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            temperature.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.apply(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontSizeFactor: 2,
                                    fontWeightDelta: 3),
                          ),
                          Transform.translate(
                            offset: const Offset(0, 10),
                            child: Text(
                              "°C",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.apply(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: const Offset(20, 0),
                        child: SvgPicture.asset(
                          "assets/weather_icons/$svg",
                          width: 140,
                          height: 140,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        location,
                        style: Theme.of(context).textTheme.headlineSmall?.apply(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSizeFactor: 0.7,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
