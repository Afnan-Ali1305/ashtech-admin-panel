import 'package:ashtech_app/features/employee/model/employee_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class EmployeeNotifier extends StateNotifier<List<EmployeeModel>> {
  EmployeeNotifier()
      : super(const [
          EmployeeModel(
            code: 'ASH-001',
            name: 'Soban Farooq',
            fathersName: 'USMAN FAROOQ',
            designation: 'CEO',
            status: 'active',
            joinedDate: '01-Jul-2023',
            email: 'sobanfarooqq@gmail.com',
            phone: '03020900039',
            cnic: '38403-0254076-3',
            address: '197,2 Defence town sargodha',
            bankName: 'Habib Metro',
            bankAccount: '6027020620714163708',
            basicSalary: '-',
            allowances: '-',
            deductions: '-',
          ),
          EmployeeModel(
            code: 'ASH-002',
            name: 'Abdul Basit',
            fathersName: 'N/A',
            designation: 'Co-founder',
            status: 'active',
            joinedDate: '23-Jun-2023',
            email: 'abdulbasit@ashtech.com',
            phone: '03001234567',
            cnic: '38403-1234567-1',
            address: 'Sargodha, Pakistan',
            bankName: 'Meezan Bank',
            bankAccount: '1234567890123456',
            basicSalary: '-',
            allowances: '-',
            deductions: '-',
          ),
        ]);

  void addEmployee(EmployeeModel employee) {
    state = [...state, employee];
  }
}

final employeeListProvider =
    StateNotifierProvider<EmployeeNotifier, List<EmployeeModel>>((ref) {
  return EmployeeNotifier();
});