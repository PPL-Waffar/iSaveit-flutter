class User {
  String sessionId;
  String? datetime;
  bool? isCitizen;
  String email;
  String? name;

  User(
      {required this.sessionId,
      this.datetime,
      this.isCitizen,
      required this.email,
      this.name});
}
