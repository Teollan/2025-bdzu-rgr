typedef Extractor<T> = dynamic Function(T);

class Table<T> {
  final Map<String, Extractor<T>> columns;

  late final List<String> columnNames;

  Table({required this.columns}) {
    columnNames = columns.keys.toList();
  }

  String build(Iterable<T> items) {
    if (columns.isEmpty) {
      return '';
    }

    final rows = [columnNames, ...items.map(getRowContent)];

    final columnWidths = calculateColumnWidths(rows);

    final buffer = StringBuffer();
    final border = buildBorder(columnWidths);

    buffer.writeln(border);

    buffer.writeln(buildRow(columnNames, columnWidths));

    buffer.writeln(border);

    for (final row in rows.skip(1)) {
      buffer.writeln(buildRow(row, columnWidths));
    }

    buffer.writeln(buildBorder(columnWidths));

    return buffer.toString();
  }

  String buildBorder(List<int> columnWidths) {
    final parts = columnWidths.map((width) => '-' * (width + 2));
    return '+${parts.join('+')}+';
  }

  String buildRow(List<String> cells, List<int> columnWidths) {
    final parts = <String>[];

    for (int i = 0; i < cells.length; i++) {
      final cell = cells[i];
      final width = columnWidths[i];

      parts.add(' ${cell.padRight(width)} ');
    }

    return '|${parts.join('|')}|';
  }

  List<String> getRowContent(T item) {
    return columnNames.map((column) => getCellContent(item, column)).toList();
  }

  String getCellContent(T item, String column) {
    final extract = columns[column]!;

    return extract(item).toString();
  }

  List<int> calculateColumnWidths(List<List<String>> rows) {
    final columnWidths = <int>[];

    for (int i = 0; i < columnNames.length; i++) {
      int maxWidth = columnNames[i].length;

      for (final row in rows) {
        maxWidth = maxWidth > row[i].length ? maxWidth : row[i].length;
      }

      columnWidths.add(maxWidth);
    }

    return columnWidths;
  }
}

class ColumnValueTable extends Table<MapEntry<String, dynamic>> {
  ColumnValueTable()
    : super(columns: {'column': (c) => c.key, 'value': (c) => c.value});
}
