import 'package:demo/screens/weather/weatherapi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  DateTime now = DateTime.now();
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  List<Weather> _forecast = [];
  Weather? _todayWeather;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  void _fetchWeatherData() async {
    try {
      final today = await _wf.currentWeatherByCityName('Kakinada');
      final forecast = await _wf.fiveDayForecastByCityName('Kakinada');

      final filtered = <Weather>[];
      final seenDays = <String>{};

      for (var w in forecast) {
        final day = DateFormat('yyyy-MM-dd').format(w.date!);
        if (!seenDays.contains(day)) {
          seenDays.add(day);
          filtered.add(w);
        }
        if (filtered.length == 5) break;
      }

      filtered[0] = today;

      setState(() {
        _forecast = filtered;
        _todayWeather = today;
      });
    } catch (e) {
      print("Failed to load forecast: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
          _forecast.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : PageView.builder(
                itemCount: _forecast.length,
                itemBuilder: (context, index) {
                  return _weatherCard(_forecast[index], index == 0);
                },
              ),
    );
  }

  Widget _weatherCard(Weather weather, bool isToday) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.25,

        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(34.0),
          image:DecorationImage(image: AssetImage('assets/cloud.jpg'),fit: BoxFit.cover,opacity: 0.6 ) ,
          boxShadow: [BoxShadow(
            
            color:   Colors.grey.shade500,spreadRadius: 0.50,blurRadius: 1,offset: Offset(4, 4))],
          color:
              kIsWeb
                  ? Color.fromARGB(255, 174, 211, 223)
                  : Colors.blue.shade200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34),
                  topRight: Radius.circular(34),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      DateFormat('EEEE').format(now),
                      style: GoogleFonts.michroma(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      // style: TextStyle(
                      //   fontSize: 28,
                      //   fontWeight: FontWeight.w600,
                      // ),
                    ),
                    Spacer(),
                    Text(
                      DateFormat('hh:mm a').format(now),
                      style: GoogleFonts.michroma(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${weather.temperature?.celsius?.toStringAsFixed(0)}°",
                    style: GoogleFonts.orbitron(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Lottie.asset(
                    'assets/weather/thunder.json',
                    height: 160,
                    width: 160,
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Wind: ",
                        style: GoogleFonts.michroma(fontSize: 12),
                        children: [
                          TextSpan(
                            text:
                                "${weather.windSpeed?.toStringAsFixed(1)} m/s",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Pressure: ",
                        style: GoogleFonts.michroma(fontSize: 12),
                        children: [
                          TextSpan(
                            text: "${weather.pressure} hPa",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Humidity: ",
                        style: GoogleFonts.michroma(fontSize: 12),
                        children: [
                          TextSpan(
                            text: "${weather.humidity}%",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Sunrise: ",
                        style: GoogleFonts.michroma(fontSize: 12),
                        children: [
                          TextSpan(
                            text: _formatTime(_todayWeather?.sunrise),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Sunset: ",
                        style: GoogleFonts.michroma(fontSize: 12),
                        children: [
                          TextSpan(
                            text: _formatTime(_todayWeather?.sunset),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowWithIcon(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          Flexible(child: Text(text, style: _infoTextStyle())),
        ],
      ),
    );
  }

  TextStyle _infoTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    );
  }

  String _formatTime(DateTime? time) {
    if (time == null) return "--:--";
    return DateFormat.jm().format(time);
  }

  String getBackgroundImage(String? description, DateTime? time) {
    if (description == null || time == null) return 'clear_day.jpg';

    final hour = time.hour;
    final isNight = hour < 6 || hour > 18;
    final desc = description.toLowerCase();

    if (desc.contains('rain')) {
      return isNight ? 'rain_night.jpg' : 'rain_day.jpg';
    } else if (desc.contains('cloud')) {
      return isNight ? 'cloudy_night.jpg' : 'cloudy_day.jpg';
    } else if (desc.contains('clear')) {
      return isNight ? 'clear_night.jpg' : 'clear_day.jpg';
    } else if (desc.contains('snow')) {
      return isNight ? 'snow_night.jpg' : 'snow_day.jpg';
    } else if (desc.contains('mist') ||
        desc.contains('fog') ||
        desc.contains('haze')) {
      return 'mist.jpg';
    }

    return 'thunderstorm.jpg';
  }
}
