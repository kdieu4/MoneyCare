import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_care/core/log_d.dart';
import 'package:money_care/domain/entity/book_series.dart';
import 'package:money_care/domain/use_case/book_series_use_case.dart';

class OnePieceCubit extends Cubit<OnePieceState> {
  final tag = "OnePieceCubit";
  final BookSeriesUseCase bookSeriesUseCase;

  OnePieceCubit(this.bookSeriesUseCase)
    : super(
        OnePieceState(
          BookSeries(name: "One Piece", read: List.filled(0, false)),
        ),
      ) {
    getValue();
  }

  void getValue() {
    bookSeriesUseCase().listen((data) {
      logD(tag, data.read);
      emit(OnePieceState(data));
    });
  }

  void edit(int id, bool value) {
    BookSeries bookSeries = state.bookSeries;
    bookSeries.read[id] = value;
    bookSeriesUseCase.set(bookSeries);
  }
}

class OnePieceState {
  final BookSeries bookSeries;

  OnePieceState(this.bookSeries);
}
