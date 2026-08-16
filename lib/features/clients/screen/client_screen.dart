import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/features/clients/model/client_model.dart';
import 'package:ashtech_app/features/clients/provider/clients_provider.dart';
import 'package:ashtech_app/features/clients/widgets/client_card.dart';
import 'package:ashtech_app/features/clients/widgets/client_detail_sheet.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ClientScreen extends ConsumerWidget {
  const ClientScreen({super.key});

  void _showAddClientDialog(BuildContext context, WidgetRef ref) {
    final companyController = TextEditingController();
    final contactController = TextEditingController();
    final emailController = TextEditingController();
    final countryController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(
          'Add New Client',
          style: dialogContext.textTheme.titleLarge,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: companyController,
                decoration: const InputDecoration(labelText: 'Company Name'),
              ),
              const Gap(10),
              TextField(
                controller: contactController,
                decoration: const InputDecoration(labelText: 'Contact Person'),
              ),
              const Gap(10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const Gap(10),
              TextField(
                controller: countryController,
                decoration: const InputDecoration(labelText: 'Country'),
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
              if (companyController.text.trim().isNotEmpty) {
                final newClient = ClientModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  companyName: companyController.text.trim(),
                  contactPerson: contactController.text.trim(),
                  email: emailController.text.trim(),
                  country: countryController.text.trim(),
                  projectCount: 0,
                  status: 'active',
                );
                ref.read(clientsProvider.notifier).addClient(newClient);
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showClientDetails(BuildContext context, ClientModel client) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ClientDetailSheet(client: client),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(clientsProvider);

    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: context.colorScheme.surface,
        elevation: 0,
        title: Text(
          'Clients',
          style: context.textTheme.displayMedium?.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddClientDialog(context, ref),
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
      body: clients.isEmpty
          ? Center(
              child: Text(
                'No clients available.',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: clients.length,
              separatorBuilder: (_, __) => const Gap(12),
              itemBuilder: (context, index) {
                final client = clients[index];
                return ClientCard(
                  client: client,
                  onTap: () => _showClientDetails(context, client),
                  onDelete: () {
                    if (client.id != null) {
                      ref.read(clientsProvider.notifier).deleteClient(client.id!);
                    }
                  },
                );
              },
            ),
    );
  }
}