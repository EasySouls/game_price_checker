part of 'app_bloc.dart';

enum AuthStatus { authenticated, unauthenticated }

final class AppState extends Equatable {
  const AppState._({
    required this.authStatus,
    this.user = User.empty,
  });

  const AppState.authenticated(User user)
      : this._(
          authStatus: AuthStatus.authenticated,
          user: user,
        );

  const AppState.unauthenticated()
      : this._(
          authStatus: AuthStatus.unauthenticated,
        );

  final AuthStatus authStatus;
  final User user;

  @override
  List<Object> get props => [authStatus, user];
}
