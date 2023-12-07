enum UserType {

  lp(korean: "일반회원", english: "LP"),
  admin(korean: "관리자", english: "ADMIN");

  final String korean;
  final String english;

  const UserType({required this.korean, required this.english});

  factory UserType.fromEnglish(String english) {
    switch (english) {
      case "LP":
        return UserType.lp;
      case "ADMIN":
        return UserType.admin;
      default:
        return UserType.lp;
    }
  }

}