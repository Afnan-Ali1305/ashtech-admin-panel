import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/features/projects/model/project_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProjectDetailSheet extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailSheet({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.colorScheme.onSurfaceVariant.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const Gap(16),
          Text(
            project.name ?? 'Project Details',
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
          const Gap(16),
          _MetaTile(title: 'Client Name', value: project.clientName ?? 'N/A'),
          _MetaTile(title: 'Target Deadline', value: project.deadline ?? 'N/A'),
          _MetaTile(title: 'Current Status', value: project.status ?? 'N/A'),
          _MetaTile(
            title: 'Completion Rate',
            value: '${((project.progress ?? 0) * 100).toInt()}%',
          ),
          const Gap(24),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                // Non-functional download button placeholder
              },
              icon: const Icon(Icons.file_download_outlined),
              label: const Text('Download Project Summary'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const Gap(12),
        ],
      ),
    );
  }
}

class _MetaTile extends StatelessWidget {
  final String title;
  final String value;

  const _MetaTile({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}