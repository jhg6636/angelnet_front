enum FileTarget {

  fundDocumentSubmission(english: "FUND_DOCUMENT_SUBMISSION"),
  fundDocument(english: "FUND_DOCUMENT"),
  post(english: "POST"),
  lpDocument(english: "LP_DOCUMENT");

  final String english;

  const FileTarget({required this.english});

  factory FileTarget.fromEnglish(String english) {
    switch (english) {
      case "FUND_DOCUMENT_SUBMISSION":
        return FileTarget.fundDocumentSubmission;
      case "FUND_DOCUMENT":
        return FileTarget.fundDocument;
      case "POST":
        return FileTarget.post;
      case "LP_DOCUMENT":
        return FileTarget.lpDocument;
      default:
        throw Exception("Wrong File Target: $english");
    }
  }
}