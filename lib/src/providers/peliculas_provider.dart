
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider{
  String __apikey  = '46aa7e26f93fa093d6f1f7eb1dfb4f1c';
  String _url      = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future <List<Pelicula>> getEnCines() async{
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'  : __apikey,
      'language' : _language,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }


  Future <List<Pelicula>> getPopulares() async{
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key'  : __apikey,
      'language' : _language,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future <List<Pelicula>> getPeliculas(String enlace) async{
    final url = Uri.https(_url, enlace, {
      'api_key'  : __apikey,
      'language' : _language,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

}