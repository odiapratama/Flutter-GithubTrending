import 'dart:async';

import 'package:githubtrending/model/ItemTrending.dart';
import 'package:githubtrending/network/Response.dart';
import 'package:githubtrending/repository/TrendingRepository.dart';

class TrendingBloc {
  TrendingRepository _trendingRepository;
  StreamController _trendingController;

  StreamSink<Response<Trending>> get trendingListSink =>
      _trendingController.sink;

  Stream<Response<Trending>> get trendingListStream =>
      _trendingController.stream;

  TrendingBloc() {
    _trendingController = StreamController<Response<Trending>>();
    _trendingRepository = TrendingRepository();
    getTrending();
  }

  getTrending() async {
    trendingListSink.add(Response.loading("Get Trending..."));
    try {
      Trending trendingList = await _trendingRepository.getTrending();
      trendingListSink.add(Response.completed(trendingList));
    } catch (e) {
      trendingListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _trendingController.close();
  }
}
