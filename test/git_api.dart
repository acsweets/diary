import 'dart:convert';

import 'package:dio/dio.dart';

class GithubApi {
  static const String host = 'https://api.github.com';

  late Dio dio;

  GithubApi() {
    dio = Dio(BaseOptions(baseUrl: host));
  }

  Future<List<GithubRepository>> getRepositoryByUser({
    required String username,
  }) async {
    String url = '/users/$username/repos';
    Response<String> rep = await dio.get<String>(url);
    List<GithubRepository> resultReps = [];
    if (rep.statusCode == 200 && rep.data != null) {
      dynamic result = json.decode(rep.data!);
      resultReps = result.map<GithubRepository>(GithubRepository.fromJson).toList();
    }
    return resultReps;
  }
}

class GithubRepository {
  final String username;
  final String name;
  final String userAvatarUrl;
  final String description;
  final String url;
  final String language;
  final bool private;
  final int stargazersCount;
  final int forksCount;
  final String updateAt;

  const GithubRepository({
    required this.username,
    required this.name,
    required this.userAvatarUrl,
    required this.description,
    required this.url,
    required this.language,
    required this.private,
    required this.stargazersCount,
    required this.forksCount,
    required this.updateAt,
  });

  factory GithubRepository.fromJson(dynamic map) {
    return GithubRepository(
      username: map['owner']['login'] ?? '',
      userAvatarUrl: map['owner']['avatar_url'] ?? '',
      description: map['description'] ?? '',
      url: map['html_url'] ?? '',
      name: map['name'] ?? '',
      language: map['language'] ?? '',
      private: map['private'] ?? '',
      stargazersCount: map['stargazers_count'] ?? 0,
      forksCount: map['stargazers_count'] ?? 0,
      updateAt: map['updated_at'] ?? '',
    );
  }
}
