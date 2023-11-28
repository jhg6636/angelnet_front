enum LpDocumentType {

  tax(english: "TAX"),
  loc(english: "LOC"),
  ;

  final String english;

  const LpDocumentType({required this.english});

  factory LpDocumentType.fromEnglish(String english) {
    switch (english) {
      case "TAX":
        return LpDocumentType.tax;
      case "LOC":
        return LpDocumentType.loc;
      default:
        throw Exception();
    }
  }

}