## ⛅ Weather Trackr ☔

A user-friendly Weather App, designed for quick access to accurate weather information. Developed with simplicity in mind, providing real-time updates. 🌦️📱

## 📌 Features
- 🌍 Current weather conditions at a glance.
- ⏰ Hourly and daily forecasts for accurate planning.
- 📍 Location-based weather updates.
- 🌅 5-day weather forecast for advanced planning.
- 🔍 City-based search for specific weather details.
- 🎨 Intuitive and minimalist design for ease of use.
- 🌟 Animated weather icons for visual appeal.
- 🚀 Seamless navigation for a smooth user experience.
- 🌐 Reliable data sourced from reputable weather services.
  
## 📱 Screenshots
  ![app_weather_example_flutter (1)](https://github.com/haithemnini/app_weather_example_flutter/assets/88515475/5ca50695-f715-45e7-93a6-f1a6f8250b1c)

## 📄 API Docs
> [!IMPORTANT] 
This project utilizes version 3.0 of the OpenWeatherMap API.</br>
APIs used in this project :</br>
> - [Current Weather API Docs](https://openweathermap.org/api/one-call-3)</br>
> - [One Call API Docs](https://openweathermap.org/api/one-call-api#data](https://openweathermap.org/api/one-call-3#history-how))</br>

> Please ensure to choose or access the one-call-3 API for optimal results.

## 🎥 Video
https://github.com/haithemnini/app_weather_example_flutter/assets/88515475/a2653150-44f2-478e-b8ab-dbfb088e891d

## 🔑 API KEY : 
- Change `/*..APIKEY..*/` with your APIKEY
```dart
class ApiConstants {
  ApiConstants._();
  static const String apiBaseUrl = "https://api.openweathermap.org/data/2.5/";
  static const String apiKey = "/*..APIKEY..*/";

  // Weather Endpoints Constants
  static const String defaultExclude = 'hourly,minutely,alerts';
}
```

## 📦 Packages in use :
- BloC
- dio
- freezed
- freezed_annotation
- retrofit
- retrofit_generator
- json_annotation
- json_serializable
- geolocator
- geocoding

<strong>Stay informed with Weather App – Your daily weather companion! 🌤️🌧️📱</strong>
