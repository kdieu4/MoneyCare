
import 'package:flutter/material.dart';
import 'package:money_care/core/service_locator.dart';

import '../entity/book_series.dart';
import '../repository/book_series_repository.dart';

class BookSeriesUseCase {
  final BookSeriesRepository bookSeriesRepository = getIt.get<BookSeriesRepository>();

  void call(ValueChanged<BookSeries> changes) => bookSeriesRepository.getSeries(changes);

  Future<void> set(BookSeries bookSeries) => bookSeriesRepository.setSeries(bookSeries);
}