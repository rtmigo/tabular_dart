import 'package:tabular/src/inner.dart';

void main() {
  final zdata = [
    ['Continent', 'Country', 'Islands', 'Population', 'Per island'],
    ['Europe', 'Norway', 55000, 5421241, 98.6],
    ['North America', 'Canada', 52455, 37742154, 719.5],
    ['Asia', 'Indonesia', 17508, 273523615, 15622.8],
    ['Europe', 'Finland', 188000, 5540720, 29.5],
    ['Asia', 'Japan', 6853, 126476461, 18455.6],
    ['Europe', 'Sweden', 221800, 10099265, 45.5],
  ];

  var data = [
    ['Season', '#', 'Name', 'Days', 'Sun'],
    ['Winter', 1, 'January', 31, 94],
    ['Winter', 2, 'February', 28, 123],
    ['Spring', 3, 'March', 31, 42],
    ['Spring', 4, 'April', 30, 243],
    ['Spring', 5, 'May', 31, 5523],
    ['Summer', 6, 'June', 30, 11251],
    ['Summer', 7, 'July', 31, 17451],
    ['Summer', 8, 'August', 31, 18707],
    ['Autumn', 9, 'September', 30, 7025],
    ['Autumn', 10, 'October', 31, 5041],
    ['Autumn', 11, 'November', 30, 2302],
    ['Winter', 12, 'December', 31, 258],
  ];

  print(tabular(data));
  // print('');
  // print(tabular(data, markdownAlign: true));
  // print('');
  //
  // print(tabular(data, sort: [Sort('Per island')]));
  // print('');
  // print(tabular(data, sort: [Sort('Per island', false)]));
  // print('');
  // print(tabular(data, sort: [Sort('Continent'), Sort('Country')]));

}
