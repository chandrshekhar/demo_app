class JsonModel {
  String id;
  String firstName;
  String image;

  JsonModel({required this.id, required this.firstName, required this.image});

  JsonModel.initialState()
      : id = "",
        firstName = "",
        image = "";

  factory JsonModel.fromJson(Map<String, dynamic> data) {
    return JsonModel(
        id: data["id"], firstName: data["firstName"], image: data["image"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['image'] = image;
    return data;
  }
}
