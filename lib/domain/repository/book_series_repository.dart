import 'package:money_care/domain/entity/book_series.dart';

abstract class BookSeriesRepository {
  Stream<BookSeries> getSeries();

  Future<void> setSeries(final BookSeries bookSeries);
}
