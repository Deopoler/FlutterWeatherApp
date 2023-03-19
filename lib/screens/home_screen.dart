import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';

import '../widgets/hourly_card_widget.dart';
import '../widgets/today_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        elevation: 0,
        title: const Text("Weather Forecast"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                future: WeatherService.getTodaysWeather(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return TodayCard(
                      location: snapshot.data!.location,
                      temperature: snapshot.data!.temperature,
                      svg: snapshot.data!.svg,
                    );
                  } else {
                    return const LinearProgressIndicator();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: WeatherService.getHourlyWeather(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final weather = snapshot.data!;
                    return SizedBox(
                      height: 225,
                      child: ListView.separated(
                        itemCount: weather.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return HourlyCard(
                            precipitationProbability:
                                weather[index].precipitationProbability,
                            svg: weather[index].svg,
                            temperature: weather[index].temperature,
                            time: weather[index].time,
                            index: index,
                          );
                        },
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
