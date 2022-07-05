import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/fake_weather_repository.dart';
import 'package:bloc_tutorial/data/model/weather.dart';
import 'package:bloc_tutorial/data/weather_repository.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc({required this.repository}) : super(WeatherInitial()) {
    on<GetWeather>(_getWeather);
    on<GetDetailedWeather>(_getWeatherDetail);
  }

  _getWeather(GetWeather event, Emitter<WeatherState> emit) async {
    emit(const WeatherLoading());
    try {
      final weather = await repository.fetchWeather(event.cityName);
      emit(WeatherLoaded(weather));
    } on NetworkError {
      emit(const WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }

  _getWeatherDetail(
      GetDetailedWeather event, Emitter<WeatherState> emit) async {
    emit(const WeatherLoading());
    try {
      final weather = await repository.fetchDetailedWeather(event.cityName);
      emit(WeatherLoaded(weather));
    } on NetworkError {
      emit(const WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
