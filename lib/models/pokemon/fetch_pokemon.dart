import 'dart:convert';
import 'dart:io';

import 'package:caremixer_technical_assesment/models/pokemon/pokedex.dart';
import 'package:http/http.dart' as http;

class FetchPokemon
{
  // Combines the server URL and query params into a URI object.
  Uri _getUri(Map<String, String>? queryParameters) {
    Uri uri = Uri(
        scheme: "https",
        host: "pokeapi.co",
        path: '/api/v2/pokemon',
        queryParameters: queryParameters
    );
    return uri;
  }

  /// Sends a get request for the pokemon.
  Future<Pokedex?> get({Map<String, String>? headers, Map<String, String>? queryParameters}) async {
    Uri uri = _getUri(queryParameters);
    try {
      http.Response response = await http.get(uri, headers: headers).timeout(const Duration(seconds: 5), onTimeout: () {return http.Response("", 503);});
      if (response.statusCode == 503)
      {
        return null;
      }
      return Pokedex(jsonDecode(response.body));
    }
    on SocketException
    {
      return null;
    }
    catch (e)
    {
      return null;
    }
  }
}