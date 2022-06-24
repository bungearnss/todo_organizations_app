class Participant {
  final String imgProfile;

  Participant({required this.imgProfile});

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(imgProfile: json['part']);
  }
}
