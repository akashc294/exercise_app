class Exercises {
  String? bodyPart;
  String? equipment;
  String? gifUrl;
  String? id;
  String? name;
  String? target;

  Exercises(
      {this.bodyPart,
        this.equipment,
        this.gifUrl,
        this.id,
        this.name,
        this.target});

  Exercises.fromJson(Map<String, dynamic> json) {
    bodyPart = json['bodyPart'];
    equipment = json['equipment'];
    gifUrl = json['gifUrl'];
    id = json['id'];
    name = json['name'];
    target = json['target'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bodyPart'] = this.bodyPart;
    data['equipment'] = this.equipment;
    data['gifUrl'] = this.gifUrl;
    data['id'] = this.id;
    data['name'] = this.name;
    data['target'] = this.target;
    return data;
  }
}