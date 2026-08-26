import 'package:flutter_bloc/flutter_bloc.dart';
part 'prodcuts_state.dart';

class ProdcutsCubit extends Cubit<ProdcutsState> {
  ProdcutsCubit() : super(ProdcutsInitial());
}
