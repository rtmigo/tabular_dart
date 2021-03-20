import 'package:tabular/src/inner.dart';

void main() {
  final data = [
    ['Continent', 'Country', 'Islands', 'Population', 'Per island'],
    ['Europe', 'Norway', 55000, 5421241, 98.6],
    ['North America', 'Canada', 52455, 37742154, 719.5],
    ['Asia', 'Indonesia', 17508, 273523615, 15622.8],
    ['Europe', 'Finland', 188000, 5540720, 29.5],
    ['Asia', 'Japan', 6853, 126476461, 18455.6],
    ['Europe', 'Sweden', 221800, 10099265, 45.5],
  ];

  print(tabular(data));
  print('');
  print(tabular(data, sort: [Sort('Per island')]));
}
