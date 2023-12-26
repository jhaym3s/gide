class Prev {
  Prev();

  factory Prev.fromJson(Map<String, dynamic> json) {
    //!error here
    return Prev();
  }

  Map<String, dynamic> toJson() {
    //!error here
    return {};
  }
}
