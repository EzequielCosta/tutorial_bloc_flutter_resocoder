import 'package:bloc_tutorial/bloc/weather_bloc.dart';
import 'package:bloc_tutorial/data/fake_weather_repository.dart';
import 'package:bloc_tutorial/pages/weather_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: BlocProvider(
        create: (context) => WeatherBloc(repository: FakeWeatherRepository()),
        child: WeatherSearchPage(),
      ),
    );
  }
}
