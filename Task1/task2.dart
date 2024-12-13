void main() {
  // your distance to the office from home
  double distance = 25;
  //your velocity
  double speed = 40.0;
  print(
      "the time taken toreach the office in hours is :${distance / speed} Hour");
  print(
      "the time taken toreach the office in minutes is :${(distance * 60) / speed} Minute");
  print(
      "the time taken toreach the office in seconds is :${(distance * 60 * 60) / speed} Second");
}
