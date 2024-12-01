enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  // Constructor
  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);

  // Named constructor for specific types of employees
  Employee.mobileDeveloper(String name, Address address, int yearsOfExperience)
      : this(name, 40000, [Skill.FLUTTER, Skill.DART], address, yearsOfExperience);

  // Getters
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  // Method to compute salary
  double computeSalary() {
    double salary = _baseSalary;
    salary += _yearsOfExperience * 2000;

    for (Skill skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }

    return salary;
  }

  // Print details
  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}, Total Salary: \$${computeSalary()}');
  }
}

void main() {
  var address1 = Address('123 Main St', 'Phnom Penh', '12000');
  var emp1 = Employee('Sokea', 40000, [Skill.FLUTTER, Skill.DART], address1, 5);
  emp1.printDetails();

  var address2 = Address('456 Elm St', 'Siem Reap', '14000');
  var emp2 = Employee.mobileDeveloper('Ronan', address2, 3);
  emp2.printDetails();
}
