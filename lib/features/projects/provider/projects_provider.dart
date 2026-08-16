import 'package:ashtech_app/features/projects/model/project_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class ProjectsNotifier extends StateNotifier<List<ProjectModel>> {
  ProjectsNotifier() : super(_initialProjects);

  static const List<ProjectModel> _initialProjects = [
    ProjectModel(
      id: '1',
      name: 'EMS Portal Redesign',
      clientName: 'Dar e Arqam Schools',
      deadline: '25 Aug 2026',
      status: 'In Progress',
      progress: 0.65,
    ),
    ProjectModel(
      id: '2',
      name: 'Real Estate Mobile App',
      clientName: 'HRT Properties',
      deadline: '10 Sep 2026',
      status: 'In Progress',
      progress: 0.30,
    ),
  ];

  void addProject(ProjectModel newProject) {
    state = [...state, newProject];
  }

  void deleteProject(String id) {
    state = state.where((project) => project.id != id).toList();
  }
}

final projectsProvider = StateNotifierProvider<ProjectsNotifier, List<ProjectModel>>((ref) {
  return ProjectsNotifier();
});