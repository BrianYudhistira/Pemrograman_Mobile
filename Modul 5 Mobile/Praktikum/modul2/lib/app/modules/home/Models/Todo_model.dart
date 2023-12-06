class TodoModel {
  String title;
  String description;
  String id;
  bool isDone;
  DateTime createAT;

  TodoModel({
    required this.title,
    required this.description,
    required this.isDone,
    required this.createAT,
    required this.id
  });

  TodoModel.fromJson(Map<String, dynamic> json, String tempID)
      : title = json['title'] ?? '',
        description = json['description'] ?? '',
        isDone = json['isDone'] ?? false,
        createAT = json['createdAT'] != null ? DateTime.parse(json['createdAT']) : DateTime.now(),
        id = tempID;


  Map<String, dynamic> toJson() => {
    'title': title,
    'description' : description,
    'isDone' : isDone,
    'createdAT': createAT.toIso8601String()
  };
}