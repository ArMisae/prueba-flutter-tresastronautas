import 'package:dio/dio.dart';
import 'package:prueba_flutter_nasa/models/movies_response.dart';

class MoviesService {
  final _dio = Dio();

  final apiKey = '647f59f083fa6065e5e9b0e63384f5e6';
  final baseUrl = 'https://api.themoviedb.org/3';

  Future<MoviesResponse> getNowPlaying() async {
    final url = '$baseUrl/movie/now_playing';

    try {
      final resp = await _dio.get(url,
          queryParameters: {'api_key': apiKey, 'language': 'es-ES', 'page': 1});

      final moviesResponse = MoviesResponse.fromJson(resp.data);

      return moviesResponse;
    } catch (e) {
      return MoviesResponse(results: []);
    }
  }
}
