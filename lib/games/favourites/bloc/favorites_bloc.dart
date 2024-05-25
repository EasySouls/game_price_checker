import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_repository/games_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<FavoritesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
