enum UserLevel {

  lp(korean: "일반회원", english: "LP"),
  admin(korean: "관리자", english: "ADMIN");

  final String korean;
  final String english;

  const UserLevel({required this.korean, required this.english});

  factory UserLevel.fromEnglish(String english) {
    switch (english) {
      case "LP":
        return UserLevel.lp;
      case "ADMIN":
        return UserLevel.admin;
      default:
        return UserLevel.lp;
    }
  }

}