import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController name = TextEditingController();
  String? _country;
  final String _apiKey = "d81e7898ed3d4b8187d220140252003";
  Map<String, dynamic>? weatherData;
  bool isLoading = false;

  Future<void> fetchData() async {
    if (_country == null || _country!.isEmpty) return;

    setState(() {
      isLoading = true;
    });

    String url =
        "http://api.weatherapi.com/v1/forecast.json?key=$_apiKey&q=$_country&days=12&aqi=no&alerts=no";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          weatherData = json.decode(response.body);
        });
      } else {
        print("Failed to load weather data");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      home: Scaffold(
        backgroundColor: const Color(0xFFFFA957),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFA957),
          title: const Text(
            "Nabil",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                child: TextField(
                  textAlign: TextAlign.left,
                  controller: name,
                  onChanged: (value) {
                    setState(() {
                      _country = value;
                    });
                  },
                  onSubmitted: (value) {
                    fetchData();
                  },
                  decoration: InputDecoration(
                    hintText: "Search here ...",
                    hintStyle: const TextStyle(fontSize: 20),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: fetchData,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFFCC999),
                    border: const OutlineInputBorder(),
                    focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFFA957))),
                    enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFFA957))),
                  ),
                ),
              ),
            ),
            isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : weatherData != null
                ? Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.location_pin, color: Colors.white, size: 45),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${weatherData!["location"]["country"]}",
                            style: const TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Text(
                            "${weatherData!["location"]["name"]}",
                            style: const TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${weatherData!["current"]["condition"]["text"]}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "${weatherData!["current"]["temp_c"]}°C",
                              style: const TextStyle(fontSize: 40, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.network(
                          "https:${weatherData!["current"]["condition"]["icon"]}",
                          width: 64,
                          height: 64,
                        ),
                      ),
                    ],
                  ),


                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weatherData!["forecast"]["forecastday"].length,
                      itemBuilder: (context, i) {
                        var day = weatherData!["forecast"]["forecastday"][i];

                        return Container(
                          width: 120,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              Text(
                                "${day["date"]}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${day["day"]["condition"][ "text"]}",
                                style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),



                              Image.network(
                                "https:${day["day"]["condition"]["icon"]}",
                                width: 50,
                              ),



                              Text(
                                "${day["day"]["avgtemp_c"]}",
                                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                                textAlign: TextAlign.center,
                              ),

                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
                : const Text("Enter a city to get weather info", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
