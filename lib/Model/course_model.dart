class Courses {
  final String courseTitle;
  final List<ModuleModel> modules;

  Courses({
    required this.courseTitle,
    required this.modules,
  });

  Map<String, dynamic> toMap() {
    return {
      "courseTitle": courseTitle,
      "modules": modules.map((module) => module.toMap()).toList(),
    };
  }
}

class ModuleModel {
  final String moduleTitle;
  final List<LessonModel> lessons;

  ModuleModel({
    required this.moduleTitle,
    required this.lessons,
  });

  Map<String, dynamic> toMap() {
    return {
      "moduleTitle": moduleTitle,
      "lessons": lessons.map((lesson) => lesson.toMap()).toList(),
    };
  }
}

class LessonModel {
  final String lessonTitle;
  final String lessonDescription;

  LessonModel({
    required this.lessonTitle,
    required this.lessonDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      "lessonTitle": lessonTitle,
      "lessonDescription": lessonDescription,
    };
  }
}
