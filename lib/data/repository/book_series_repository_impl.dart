import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:money_care/domain/entity/book_series.dart';
import 'package:money_care/domain/repository/book_series_repository.dart';

class BookSeriesRepositoryImpl extends BookSeriesRepository {
  late DatabaseReference ref;
  final StreamController<BookSeries> bookSeriesController =
      StreamController<BookSeries>.broadcast();

  BookSeriesRepositoryImpl() {
    final firebaseApp = Firebase.app();
    final firebaseDatabase = FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL:
          'https://moneycare-606f9-default-rtdb.asia-southeast1.firebasedatabase.app/',
    );
    ref = firebaseDatabase.ref("one-piece-book");
  }

  @override
  Stream<BookSeries> getSeries() {
    ref.onValue.listen((event) {
      final data = event.snapshot.value;
      final List<bool> read = List.filled(150, false, growable: true);
      data
          .toString()
          .trim()
          .split(" ")
          .map((it) {
            return int.parse(it);
          })
          .toList()
          .forEach((it) {
            read[it] = true;
          });
      bookSeriesController.sink.add(BookSeries(name: "One Piece", read: read));
    });
    return bookSeriesController.stream;
  }

  @override
  Future<void> setSeries(BookSeries bookSeries) async {
    StringBuffer stringBuffer = StringBuffer();
    for (var i = 0; i < bookSeries.read.length; i++) {
      if (bookSeries.read[i]) {
        stringBuffer.write("$i ");
      }
    }
    ref.set(stringBuffer.toString());
  }
}
