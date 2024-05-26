import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_price_checker/app/bloc/app_bloc.dart';
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
    if (query.isEmpty) {
      return;
    }
    context.read<HomeCubit>().setTab(HomeTab.results);
    context.read<GamesSearchBloc>().add(GameSearchQuerySubmitted(query));
    _controller.clear();
  }

  late final SearchController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SearchController();
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
              ),
              Text(
                l10n.searchPageTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
              ),
              SearchForm(
                onSearch: _onSearch,
                controller: _controller,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.2,
              ),
              MaterialButton(
                minWidth: MediaQuery.sizeOf(context).width * 0.4,
                color: Colors.tealAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                onPressed: () {
                  _onSearch(context, _controller.text);
                },
                child: Text(
                  l10n.letsSearch,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                minWidth: MediaQuery.sizeOf(context).width * 0.4,
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                onPressed: () {
                  context.read<HomeCubit>().setTab(HomeTab.favourites);
                },
                child: Text(
                  l10n.seeFavorites,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return MaterialButton(
                    minWidth: MediaQuery.sizeOf(context).width * 0.4,
                    color: Colors.tealAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    onPressed: () {
                      if (state.user != User.empty) {
                        context.read<AppBloc>().add(const AppLogoutRequested());
                      } else {
                        context.read<HomeCubit>().setTab(HomeTab.login);
                      }
                    },
                    child: Text(
                      state.user != User.empty ? l10n.logout : l10n.login,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
