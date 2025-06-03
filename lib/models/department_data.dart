import 'package:flutter/foundation.dart';

class DepartmentData extends ChangeNotifier {
  String _selectedDepartment = '';

  String get selectedDepartment => _selectedDepartment;

  void setSelectedDepartment(String department) {
    _selectedDepartment = department;
    notifyListeners();
  }
}
