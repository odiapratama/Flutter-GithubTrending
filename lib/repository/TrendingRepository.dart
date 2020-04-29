import 'package:githubtrending/network/ApiProvider.dart';
import 'package:githubtrending/model/ItemTrending.dart';

class TrendingRepository {
  ApiProvider _api = ApiProvider();

  Future<Trending> getTrending() async {
    final response = await _api.get(PATH);
    return Trending.fromJson(response);
  }
}
