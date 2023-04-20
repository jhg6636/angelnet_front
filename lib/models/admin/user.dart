class User {

  String stringId;
  String name;
  String userLevel;
  String? workPlace;
  String phone;
  String? recommender;
  DateTime createdAt;

  User(
      {
        required this.stringId,
        required this.name,
        required this.userLevel,
        required this.workPlace,
        required this.phone,
        required this.recommender,
        required this.createdAt,
      }
  );

}