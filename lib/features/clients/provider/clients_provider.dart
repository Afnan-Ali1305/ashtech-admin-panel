import 'package:ashtech_app/features/clients/model/client_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class ClientsNotifier extends StateNotifier<List<ClientModel>> {
  ClientsNotifier() : super(_initialClients);

  static const List<ClientModel> _initialClients = [
    ClientModel(
      id: '1',
      companyName: 'Dar e Arqam Schools',
      contactPerson: 'Bakhzada Khan',
      email: 'contact@darearqam.edu.pk',
      country: 'Pakistan',
      projectCount: 0,
      status: 'inactive',
    ),
    ClientModel(
      id: '2',
      companyName: 'HRT Properties',
      contactPerson: 'Taimoor Asghar',
      email: 'info@hrtproperties.ae',
      country: 'Dubai',
      projectCount: 0,
      status: 'active',
    ),
  ];

  void addClient(ClientModel newClient) {
    state = [...state, newClient];
  }

  void deleteClient(String id) {
    state = state.where((client) => client.id != id).toList();
  }
}

final clientsProvider = StateNotifierProvider<ClientsNotifier, List<ClientModel>>((ref) {
  return ClientsNotifier();
});