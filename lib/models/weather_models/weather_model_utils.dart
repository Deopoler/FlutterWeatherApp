String weathercodeToDaySvg(int weathercode) {
  switch (weathercode) {
    case 0:
    case 1:
      return "clear-day.svg";
    case 2:
      return "partly-cloudy-day.svg";
    case 3:
      return "cloudy.svg";
    case 45:
    case 48:
      return "fog.svg";
    case 51:
    case 53:
    case 55:
    case 56:
    case 57:
      return "drizzle.svg";
    case 61:
    case 63:
    case 65:
    case 66:
    case 67:
    case 80:
    case 81:
    case 82:
      return "rain.svg";
    case 71:
    case 73:
    case 75:
    case 77:
    case 85:
    case 86:
      return "snow.svg";
    default:
      return "thunderstorm.svg";
  }
}

String weathercodeToNightSvg(int weathercode) {
  switch (weathercode) {
    case 0:
    case 1:
      return "clear-night.svg";
    case 2:
      return "partly-cloudy-night.svg";
    case 3:
      return "cloudy.svg";
    case 45:
    case 48:
      return "fog.svg";
    case 51:
    case 53:
    case 55:
    case 56:
    case 57:
      return "drizzle.svg";
    case 61:
    case 63:
    case 65:
    case 66:
    case 67:
    case 80:
    case 81:
    case 82:
      return "rain.svg";
    case 71:
    case 73:
    case 75:
    case 77:
    case 85:
    case 86:
      return "snow.svg";
    default:
      return "thunderstorm.svg";
  }
}
