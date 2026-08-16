import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/features/projects/model/project_model.dart';
import 'package:ashtech_app/features/projects/provider/projects_provider.dart';
import 'package:ashtech_app/features/projects/widgets/project_card.dart';
import 'package:ashtech_app/features/projects/widgets/project_detail_sheet.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ProjectScreen extends ConsumerWidget {
  const ProjectScreen({super.key});

  void _showAddProjectDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final clientController = TextEditingController();
    final deadlineController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(
          'Add New Project',
          style: dialogContext.textTheme.titleLarge,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Project Name'),
              ),
              const Gap(10),
              TextField(
                controller: clientController,
                decoration: const InputDecoration(labelText: 'Client Name'),
              ),
              const Gap(10),
              TextField(
                controller: deadlineController,
                decoration: const InputDecoration(
                  labelText: 'Deadline (e.g. 15 Sep 2026)',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.trim().isNotEmpty) {
                final newProject = ProjectModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: nameController.text.trim(),
                  clientName: clientController.text.trim(),
                  deadline: deadlineController.text.trim(),
                  status: 'In Progress',
                  progress: 0.1,
                );
                ref.read(projectsProvider.notifier).addProject(newProject);
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showProjectDetails(BuildContext context, ProjectModel project) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ProjectDetailSheet(project: project),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);

    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: context.colorScheme.surface,
        elevation: 0,
        title: Text(
          'Projects',
          style: context.textTheme.displayMedium?.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddProjectDialog(context, ref),
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
      body: projects.isEmpty
          ? Center(
              child: Text(
                'No projects active.',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: projects.length,
              separatorBuilder: (_, __) => const Gap(12),
              itemBuilder: (context, index) {
                final project = projects[index];
                return ProjectCard(
                  project: project,
                  onTap: () => _showProjectDetails(context, project),
                  onDelete: () {
                    if (project.id != null) {
                      ref
                          .read(projectsProvider.notifier)
                          .deleteProject(project.id!);
                    }
                  },
                );
              },
            ),
    );
  }
}
