import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_price_checker/games/search/bloc/games_search_bloc.dart';
import 'package:game_price_checker/games/search/widgets/widgets.dart';
import 'package:game_price_checker/home/cubit/home_cubit.dart';
import 'package:game_price_checker/l10n/l10n.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchView();
  }
}

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  void _onSearch(BuildContext context, String query) {
    context.read<HomeCubit>().setTab(HomeTab.results);
    context.read<GamesSearchBloc>().add(GameSearchQuerySubmitted(query));
  }

  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.searchPageTitle),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const Text('Search for a game title'),
              const SizedBox(height: 8),
              SearchForm(
                onSearch: _onSearch,
                controller: _controller,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _onSearch(context, _controller.text);
                },
                child: const Text("Let's search!"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<HomeCubit>().setTab(HomeTab.favourites);
                },
                child: const Text('See favorites'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
