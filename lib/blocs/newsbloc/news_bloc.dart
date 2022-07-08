import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/article_model.dart';
import '../../repository/news_repository.dart';
import 'news_events.dart';
import 'news_state.dart';

// class NewsBloc extends Bloc<NewsEvents, NewsStates> {
//   NewsRepository newsRepository;
//
//   NewsBloc({required NewsStates initialState, required this.newsRepository})
//       : super(initialState) {
//     on<StartEvent>((event, emit) {
//       add(StartEvent());
//     });
//   }
//
//   @override
//   Stream<NewsStates> mapEventsToState(NewsEvents event) async* {
//     if (event is StartEvent) {
//       try {
//         List<ArticleModel> _articleList = [];
//         yield NewsLoadingState();
//         // var newsRepository;
//         _articleList = await newsRepository.fetchNews();
//         yield NewsLoadedState(articleList: _articleList);
//       } catch (e) {
//         yield NewsErrorState(errorMessage: e);
//       }
//     }
//   }
// }

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsInitState()) {
    on<NewsEvents>((event, emit) async {
      if (event is StartEvent) {
        emit(NewsLoadingState());
        List<ArticleModel>? articleList = await newsRepository.fetchNews();
        if (articleList == null) {
          emit(NewsErrorState());
        } else {
          emit(NewsLoadedState(articleList: articleList));
        }
      }
    });
  }
}
