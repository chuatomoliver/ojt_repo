class Journal {
  String? id;
  String title = '';
  String date = '';
  String content = '';
  String imgPath = '';

  Journal({
    this.id,
    required this.title,
    required this.date,
    required this.content,
    required this.imgPath,
  });

  Journal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    content = json['content'];
    imgPath = json['imgPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['date'] = date;
    data['content'] = content;
    data['imgPath'] = imgPath;
    return data;
  }
}
