
import 'package:flutter_bloc/flutter_bloc.dart';

class MoneyCubit extends Cubit<MoneyState> {
  MoneyCubit(): super(None());

}

abstract class MoneyState {

}

class None extends MoneyState {

}

class AddMoneyRecord extends MoneyState {

}