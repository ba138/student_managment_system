class Courses {
  final String courseTitle;
  final List<ModuleModel> modules;
  final String imageUrl;
  final String courseDescription;
  // Optional field for the course image URL

  Courses({
    required this.courseTitle,
    required this.modules,
    required this.imageUrl,
    required this.courseDescription, // Default to null if no image is provided
  });

  Map<String, dynamic> toMap() {
    return {
      "courseTitle": courseTitle,
      "modules": modules.map((module) => module.toMap()).toList(),
      "imageUrl": imageUrl, // Add image URL to the map
    };
  }
}

class ModuleModel {
  final String moduleName;
  final String description; // Required description field for the module
  final List<LessonModel> lessons;

  ModuleModel({
    required this.moduleName,
    required this.description, // Now required
    required this.lessons,
  });

  Map<String, dynamic> toMap() {
    return {
      "moduleTitle": moduleName,
      "description": description, // Add description to the map
      "lessons": lessons.map((lesson) => lesson.toMap()).toList(),
    };
  }
}

class LessonModel {
  final String lessonName;
  final String lessonDescription;

  LessonModel({
    required this.lessonName,
    required this.lessonDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      "lessonTitle": lessonName,
      "lessonDescription": lessonDescription,
    };
  }
}
