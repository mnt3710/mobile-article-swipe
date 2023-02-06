class Repository {
  final _api = fetchList();
  dynamic fetchArticle() async {
    return _api.fetchArticle();
  }
}
