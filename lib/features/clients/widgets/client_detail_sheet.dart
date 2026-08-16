import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/features/clients/model/client_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ClientDetailSheet extends StatelessWidget {
  final ClientModel client;

  const ClientDetailSheet({super.key, required this.client});

  @override
  Widget build(BuildContext meContext) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: meContext.colorScheme.surface,
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
                color: meContext.colorScheme.onSurfaceVariant.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const Gap(16),
          Text(
            client.companyName ?? 'Client Details',
            style: meContext.textTheme.titleLarge?.copyWith(
              color: meContext.colorScheme.onSurface,
            ),
          ),
          const Gap(16),
          _DetailTile(title: 'Contact Person', value: client.contactPerson ?? 'N/A'),
          _DetailTile(title: 'Email Address', value: client.email ?? 'N/A'),
          _DetailTile(title: 'Country', value: client.country ?? 'N/A'),
          _DetailTile(title: 'Active Projects', value: '${client.projectCount ?? 0}'),
          _DetailTile(title: 'Account Status', value: client.status ?? 'N/A'),
          const Gap(24),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                // Non-functional download placeholder as requested
              },
              icon: const Icon(Icons.download_rounded),
              label: const Text('Download PDF Details'),
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

class _DetailTile extends StatelessWidget {
  final String title;
  final String value;

  const _DetailTile({required this.title, required this.value});

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