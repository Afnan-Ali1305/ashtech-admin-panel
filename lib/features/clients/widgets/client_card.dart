import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/features/clients/model/client_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ClientCard extends StatelessWidget {
  final ClientModel client;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const ClientCard({
    super.key,
    required this.client,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext meContext) {
    final company = client.companyName ?? 'Unknown Company';
    final contact = client.contactPerson ?? 'No Contact';
    final email = client.email ?? 'No Email';
    final country = client.country ?? 'N/A';
    final projects = client.projectCount ?? 0;
    final isActive = client.isActive;

    return Container(
      decoration: BoxDecoration(
        color: meContext.colorScheme.surfaceContainerHighest.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      company,
                      style: meContext.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: meContext.colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _StatusChip(isActive: isActive),
                ],
              ),
              const Gap(10),
              _InfoRow(
                icon: Icons.person_outline_rounded,
                label: 'Contact',
                value: contact,
              ),
              const Gap(6),
              _InfoRow(
                icon: Icons.email_outlined,
                label: 'Email',
                value: email,
              ),
              const Gap(6),
              Row(
                children: [
                  Expanded(
                    child: _InfoRow(
                      icon: Icons.public_outlined,
                      label: 'Country',
                      value: country,
                    ),
                  ),
                  Expanded(
                    child: _InfoRow(
                      icon: Icons.folder_outlined,
                      label: 'Projects',
                      value: '$projects',
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: onDelete,
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      size: 18,
                      color: meContext.colorScheme.error,
                    ),
                    label: Text(
                      'Delete',
                      style: meContext.textTheme.bodyMedium?.copyWith(
                        color: meContext.colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final bool isActive;

  const _StatusChip({required this.isActive});

  @override
  Widget build(BuildContext context) {
    final activeColor = const Color(0xFF10B981);
    final inactiveColor = context.colorScheme.onSurfaceVariant;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: (isActive ? activeColor : inactiveColor).withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isActive ? 'active' : 'inactive',
        style: context.textTheme.labelSmall?.copyWith(
          color: isActive ? activeColor : inactiveColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: context.colorScheme.onSurfaceVariant,
        ),
        const Gap(6),
        Text(
          '$label: ',
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}