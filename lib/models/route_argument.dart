class RouteArgument {
  String? id;
  dynamic param;

  RouteArgument({this.id, this.param});

  @override
  String toString() {
    return '{id: $id,}';
  }
}
