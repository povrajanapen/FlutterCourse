enum Skill { FLUTTER, DART, OTHER }

class Address{
  String street;
  String city;
  String zipCode;

  Address(this.street, this.city, this.zipCode);
  @override
  String toString() => '$street, $city, $zipCode';
}
class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  //constructor
  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);
  //named constructor
  Employee.mobileDeveloper(String name, Address address, int yearsOfExperience)
    : this(name, 40000, [Skill.FLUTTER, Skill.DART], address, yearsOfExperience);

  //getter methods
  String get name =>_name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  //method to compute the salary
  double Compute(){
    double total = _baseSalary + (_yearsOfExperience * 2000);
    for(var skills in _skills){
      if(skills == Skill.FLUTTER){
        total += 5000;
      }
      else if(skills == Skill.DART){
        total += 3000;
      }
      else{
        total += 1000;
      }
    }
    return total;
  }

  //em details
  void printDetails() {
    print('Employee: $_name');
    print('Address: ${_address.toString()}');
    print('Years of Experience: $_yearsOfExperience');
    print('Skills: $_skills');
    print('Base Salary: \$_${_baseSalary}');
    print('Total Salary: \$_${Compute()}');
    print('---------------------------');
  }
}

void main() {
  var address1 = Address('123 Main St', 'Phnom Penh', '12345');
  var emp1 = Employee('Sokea', 40000, [Skill.FLUTTER], address1, 5);
  emp1.printDetails();

  var address2 = Address('456 Another Rd', 'Siem Reap', '67890');
  var emp2 = Employee.mobileDeveloper('Ronan', address2, 3);
  emp2.printDetails();
}