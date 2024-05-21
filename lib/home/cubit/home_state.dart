part of 'home_cubit.dart';

enum HomeTab { search, results, favourites }

final class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.search,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
