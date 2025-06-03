import 'package:flutter/material.dart';

import 'package:money_care/domain/entity/book_series.dart';

abstract class BookSeriesRepository {
  void getSeries(ValueChanged<BookSeries> changes);

  Future<void> setSeries(final BookSeries bookSeries);
}
