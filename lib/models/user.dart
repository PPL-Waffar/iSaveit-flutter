
class User {
  String? sessionId;
  String? datetime;
  bool? isCitizen;
  String? email;
  String? name;

  User(
      {required this.sessionId,
      required this.datetime,
      required this.isCitizen,
      required this.email,
      required this.name});
}