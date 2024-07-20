class AuthUser {
  String uid;

  AuthUser({required this.uid});
}

class UserData {
  String name;
  int points;
  List<Activity> activities;
  String email;
  String phoneNum;
  int age;
  int height;
  int weight;
  int often;
  int intensity;
  int strength;
  int flexibility;
  int cardio;

  UserData(
      {required this.name,
      required this.points,
      required this.activities,
      required this.email,
      required this.phoneNum,
      required this.age,
      required this.height,
      required this.weight,
      required this.often,
      required this.intensity,
      required this.strength,
      required this.flexibility,
      required this.cardio});

  factory UserData.fromJson(Map<String, dynamic> json) {
    String name = json["name"] ?? "";
    int points = json["points"] ?? 0;
    int age = json["age"] ?? 0;
    int height = json["height"] ?? 0;
    int weight = json["weight"] ?? 0;
    String email = json["email"] ?? "";
    String phoneNum = json["phoneNum"] ?? "";
    int often = json["often"] ?? 0;
    int intensity = json["intensity"] ?? 0;
    int strength = json["strength"] ?? 0;
    int flexibility = json["flexibility"] ?? 0;
    int cardio = json["cardio"] ?? 0;

    List<Activity> activities = (json['activities'] as List?)?.map((item) => Activity.fromJson(item)).toList() ?? [];

    return UserData(
      name: name,
      points: points,
      age: age,
      height: height,
      weight: weight,
      email: email,
      phoneNum: phoneNum,
      often: often,
      intensity: intensity,
      strength: strength,
      flexibility: flexibility,
      cardio: cardio,
      activities: activities,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "points": points,
      "age": age,
      "height": height,
      "weight": weight,
      "email": email,
      "phoneNum": phoneNum,
      "often": often,
      "intensity": intensity,
      "strength": strength,
      "flexibility": flexibility,
      "cardio": cardio,
      "activities": activities.map((e) => e.toJson()).toList(),
    };
  }
}

class Activity {
  String type;
  int duration;
  int exertionLevel;
  int mets;

  Activity({required this.type, required this.duration, required this.exertionLevel, required this.mets});

  factory Activity.fromJson(Map<String, dynamic> json) {
    String type = json["type"] ?? "";
    int duration = json["duration"] ?? 0;
    int exertionLevel = json["exertionLevel"] ?? 0;
    int mets = json["mets"] ?? 0;

    return Activity(
      type: type,
      duration: duration,
      exertionLevel: exertionLevel,
      mets: mets,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "duration": duration,
      "exertionLevel": exertionLevel,
      "mets": mets,
    };
  }
}
