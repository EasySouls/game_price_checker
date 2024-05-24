import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_price_checker/games/favourites/favourites.dart';
import 'package:game_price_checker/games/search/bloc/games_search_bloc.dart';
import 'package:game_price_checker/games/search/search.dart';
import 'package:game_price_checker/home/cubit/home_cubit.dart';
import 'package:games_repository/games_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    return Scaffold(
      body: BlocProvider(
        create: (context) => GamesSearchBloc(
          gamesRepository: context.read<GamesRepository>(),
        ),
        child: IndexedStack(
          index: selectedTab.index,
          children: const [SearchPage(), FavouritesPage(), SearchResultsPage()],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.search,
              icon: const Icon(Icons.search),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.favourites,
              icon: const Icon(Icons.favorite),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.icon,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      iconSize: 24,
      icon: icon,
      color:
          groupValue == value ? null : Theme.of(context).colorScheme.secondary,
    );
  }
}
