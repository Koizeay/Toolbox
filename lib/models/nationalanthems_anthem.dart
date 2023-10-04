
class NationalAnthemsAnthem {
  String name;
  String code;

  NationalAnthemsAnthem(this.name, this.code);

  static NationalAnthemsAnthem fromJson(json) {
    return NationalAnthemsAnthem(json["name"], json["code"]);
  }
}