class User {
  final int id;
  String firstName;
  String famillyName;
  String phoneNumber;
  double rateAsClient, rateAsDriver;
  String token;
  User(
      {this.phoneNumber,
      this.firstName,
      this.rateAsClient,
      this.rateAsDriver,
      this.famillyName,
      this.id,
        this.token,
      });
}
