class WeatherIcon{
  static String getIcon(String icon){
    switch(icon){
      case '01d':
      case '01n': return "assets/png/003-sun.png";
      case '02d':
      case '02n': return "assets/png/050-sunny.png";
      case '03d':
      case '03n': return "assets/png/038-fog.png";
      case '04d':
      case '04n': return "assets/png/039-wind.png";
      case '09d':
      case '09n': return "assets/png/017-snowy.png";
      case '10d':
      case '10n': return "assets/png/016-rain.png";
      case '11d':
      case '11n': return "assets/png/020-storm.png";
      case '13d':
      case '13n': return "assets/png/017-snowy.png";
      case '50d':
      case '50n': return "assets/png/038-fog.png";
      default: return "assets/png/025-sun.png";
    }
  }
}