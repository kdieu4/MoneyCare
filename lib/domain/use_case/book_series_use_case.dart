
import '../entity/book_series.dart';
import '../repository/book_series_repository.dart';

class BookSeriesUseCase {
  final BookSeriesRepository bookSeriesRepository;

  BookSeriesUseCase(this.bookSeriesRepository);

  Stream<BookSeries> call() => bookSeriesRepository.getSeries();

  Future<void> set(BookSeries bookSeries) => bookSeriesRepository.setSeries(bookSeries);
}