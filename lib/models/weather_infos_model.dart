class WeatherInfos {
  final Map<String, int> coord;
  final List<Map<String, dynamic>> weather;
  final Map<String, int> main;
  final Map<String, int> wind;
  final String clouds;
  final Map<String, int> sys;
  final String name;

  const WeatherInfos({
    required this.coord,
    required this.weather,
    required this.main,
    required this.wind,
    required this.clouds,
    required this.sys,
    required this.name,
  });

  factory WeatherInfos.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'coord': Map<String, int> coord,
        'weather': List<Map<String, dynamic>> weather,
        'main': Map<String, int> main,
        'wind': Map<String, int> wind,
        'clouds': String clouds,
        'sys': Map<String, int> sys,
        'name': String name,
      } =>
        WeatherInfos(
          coord: coord,
          weather: weather,
          main: main,
          wind: wind,
          clouds: clouds,
          sys: sys,
          name: name,
        ),
      _ => throw const FormatException('Failed to load Weather infos.'),
    };
  }
}

Future<WeatherInfos> getWeather(double latitude, double longitude) async {}
