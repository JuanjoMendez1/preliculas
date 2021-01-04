import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:preliculas/src/models/model_pelicula.dart';

class PeliculasProvider{
  String _apikey    = 'fd4de7f83889ee72cca93a8b0fbbb0fa';
  String _url       = 'api.themoviedb.org';
  String _lenguage  = 'es-ES';

  Future<List<Pelicula>> getEnCines()async{

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apikey,
      'lenguage': _lenguage,
    });

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;

  }

  Future<List<Pelicula>> getPopulares()async{
    final url = Uri.https(_url, '3/movie/popular',{

      'api_key' : _apikey,
      'lenguage': _lenguage,

    });

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;
  }

}