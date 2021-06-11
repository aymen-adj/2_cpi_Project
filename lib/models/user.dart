class User {
  final int id;
  String firstName = "";
  String famillyName = "";
  String phoneNumber = "";
  double rateAsClient = 0, rateAsDriver = 0;
  String token = "";
  User({
    this.phoneNumber,
    this.firstName,
    this.rateAsClient,
    this.rateAsDriver,
    this.famillyName,
    this.id,
    this.token,
  });
  @override
  String toString() {
    return "${id.toString() +
        " " +
        firstName +
        " " +
        famillyName +
        " " +
        phoneNumber +
        " " +
        rateAsClient.toString() +
        " " +
        rateAsDriver.toString() +
        " " +
        token}";
  }
}
