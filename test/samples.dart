import 'package:tabular/src/inner.dart';

void main() {
  print(tabular([
    ['Continent', 'Country', 'Islands', 'Population', 'Per island'],
    ['Europe', 'Sweden', 221800, 10099265, 45.5],
    ['Europe', 'Finland', 188000, 5540720, 29.5],
    ['Europe', 'Norway', 55000, 5421241, 98.6],
    ['North America', 'Canada', 52455, 37742154, 719.5],
    ['Asia', 'Indonesia', 17508, 273523615, 15622.8],
    ['Asia', 'Japan', 6853, 126476461, 18455.6],
  ]));
}
