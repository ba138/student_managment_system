// Participant model
class Participant {
  final String name;
  final String uid;

  Participant({required this.name, required this.uid});

  // From JSON
  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      name: json['name'] ?? '',
      uid: json['uid'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uid': uid,
    };
  }
}

// Course model
class Course {
  final String courseDescription;
  final String courseId;
  final String courseImage;
  final String courseName;

  Course({
    required this.courseDescription,
    required this.courseId,
    required this.courseImage,
    required this.courseName,
  });

  // From JSON
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseDescription: json['courseDescription'] ?? '',
      courseId: json['courseId'] ?? '',
      courseImage: json['courseImage'] ?? '',
      courseName: json['courseName'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'courseDescription': courseDescription,
      'courseId': courseId,
      'courseImage': courseImage,
      'courseName': courseName,
    };
  }
}

// Group model
class Group {
  final String createdBy;
  final String groupTitle;
  final List<Participant> participants;
  final List<Course> selectedCourses;
  final String status;
  final String groupUId;

  Group({
    required this.createdBy,
    required this.groupTitle,
    required this.participants,
    required this.selectedCourses,
    required this.status,
    required this.groupUId,
  });

  // From JSON
  factory Group.fromJson(Map<String, dynamic> json) {
    var participantsList = (json['participants'] as List)
        .map((participant) => Participant.fromJson(participant))
        .toList();

    var coursesList = (json['selectedCourses'] as List)
        .map((course) => Course.fromJson(course))
        .toList();

    return Group(
      createdBy: json['createdBy'] ?? '',
      groupTitle: json['groupTitle'] ?? '',
      participants: participantsList,
      selectedCourses: coursesList,
      status: json['status'] ?? '',
      groupUId: json['groupUId'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'createdBy': createdBy,
      'groupTitle': groupTitle,
      'participants':
          participants.map((participant) => participant.toJson()).toList(),
      'selectedCourses':
          selectedCourses.map((course) => course.toJson()).toList(),
      'status': status,
      'uid': groupUId,
    };
  }
}
