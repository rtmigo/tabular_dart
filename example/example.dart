import 'package:tabular/tabular.dart';

void main() {
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

  String title(s) => '\n\n$s\n';

  print(title('JUST TABLE'));
  print(tabular(data));

  print(title('WITH VERTICAL BORDER'));
  print(tabular(data, border: Border.vertical));

  print(title('MYSQL STYLE'));
  print(tabular(data, style: Style.mysql, border: Border.all));

  print(title('WITH MARKDOWN ":"'));
  print(tabular(data, markdownAlign: true));

  print(title('WITH MODIFIED ALIGNMENT'));
  print(tabular(data, align: {'Name': Side.center, 'Sun': Side.start}));

  print(title('WITH CUSTOM FORMATTING'));
  print(tabular(data,
      format: {'Name': (value) => value.toUpperCase(), 'Sun': (value) => '+ ' + value.toString()}));

  print(title('SORTED BY FIRST COLUMN'));
  print(tabular(data, sort: [Sort(0)]));

  print(title('SORTED BY TWO COLUMNS "DAYS" AND "SUN"'));
  print(tabular(data, sort: [Sort('Days', ascending: false), Sort('Sun')]));

  print(title('SORTED WITH A CUSTOM COMPARISON'));
  print(tabular(data, sort: [Sort('Name', compare: (a, b) => a.length.compareTo(b.length))]));
}
