class ListUtils {

  List<dynamic> map(List<dynamic> originalList, Function lambda) {
    var result = List.empty(growable: true);
    for (var element in originalList) {
      result.add(lambda(element));
    }

    return result;
  }

}