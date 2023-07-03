class TodoDTO {
  String title;
  String shortDescription;
  String description;
  bool isFavorite;
  bool isDone;
  String date;

  TodoDTO({
    this.title = '',
    this.shortDescription = '',
    this.description = '',
    this.isFavorite = false,
    this.isDone = false,
    this.date = '00/00/0000',
  });

  bool get isFilled =>
      title.isNotEmpty && shortDescription.isNotEmpty && description.isNotEmpty;

  TodoDTO.clearData()
  :
    title = '',
    shortDescription = '',
    description = '',
    isFavorite = false,
    isDone = false,
    date = '00/00/0000';


  TodoDTO.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        shortDescription = json['shortDescription'],
        description = json['description'],
        isFavorite = json['isFavorite'],
        isDone = json['isDone'],
        date = json['date'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'shortDescription': shortDescription,
        'description': description,
        'isFavorite': isFavorite,
        'isDone': isDone,
        'date': date,
      };
}
