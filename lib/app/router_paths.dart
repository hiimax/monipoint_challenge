import 'package:go_router_paths/go_router_paths.dart';

class AppPath {
   static final splash = SplashPath();
  static final search = SearchPath();
  static final home = HomePath();
  static final chat = ChatPath();
  static final profile = ProfilePath();
  static final favorite = favoritePath();
}
class SplashPath extends Path<SplashPath> {
  SplashPath() : super('/');

}
class SearchPath extends Path<SearchPath> {
  SearchPath() : super('/search');
}

class HomePath extends Path<HomePath> {
  HomePath() : super('/home');
}

class ChatPath extends Path<ChatPath> {
  ChatPath() : super('/chat');
}

class ProfilePath extends Path<ProfilePath> {
  ProfilePath() : super('/profile');
}

class favoritePath extends Path<favoritePath> {
  favoritePath() : super('/favorite');
}
