
// //     longUrl: 'https://www.udemy.com/123456',//https://dev.bitly.com/

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';

import 'package:our_clothes_store/core/di/injection_container.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/routes/app_routes.dart';
import 'package:http/http.dart' as http;

class BitlyService {
    factory BitlyService() {
    return _instance;
  }
  BitlyService._();

  static final BitlyService _instance = BitlyService._();
  static final String apiKey = 'f8b9dc0c585e9140c7b9d066896c267b105f2d85';
  static final String apiUrl = 'https://api-ssl.bitly.com/v4/shorten';
  final AppLinks _appLinks = AppLinks();

  Future<String?> shortenUrl({
    required String title,
    required String imageUrl,
    required int idpro,
  }) async {
    var response = await http.post(Uri.parse(apiUrl), headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    }, body: jsonEncode({
      'long_url': 'https://com.example.our_clothes_store/$idpro',
      'domain': 'bit.ly', // Optional: Customize domain if supported by Bitly plan
      'title': title,
      'idpro': idpro
    }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      var shortLink = jsonResponse['link'];
      return '$shortLink';
    } else {
      print('Failed to shorten URL: ${response.reasonPhrase}');
      return null;
    }
  }

    void initDeepLinks() {
    _appLinks.getInitialLink().then((uri) {
      if (uri != null) {
        _handleDeepLinkNavigation( uri.path);
      }
    });

    _appLinks.uriLinkStream.listen((uri) {
  _handleDeepLinkNavigation( uri.path);
});

  }

  void _handleDeepLinkNavigation( String? path) {
    if (path == null) return;

    final splitLink = path.split('/');

    if (splitLink.isNotEmpty) {
      int productId = int.tryParse(splitLink[3])!;
       sl<GlobalKey<NavigatorState>>()
        .currentState!
        .context
        .pushName(AppRoutes.productDetails, arguments: productId);
    } else {
      debugPrint('Invalid deep link path: $path');
    }
  }

}






