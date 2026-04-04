// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐
/**
 * EXPECTED OUTPUT:
 * Manager: John Smith (ID: M001, Department: IT, Team Size: 5)
 * Job Title: Manager
 * Base Salary: 8000.0
 * Calculated Salary: 9000.0
 * Payment processed: 9000.0
 * Report: Monthly report for John Smith in IT department
 * * Developer: Alice Johnson (ID: D001, Department: IT, Language: Dart)
 * Job Title: Senior Developer
 * Base Salary: 6000.0
 * Calculated Salary: 6500.0
 * Payment processed: 6500.0
 */

// 1. Mixin Payable
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    return baseSalary + bonus;
  }

  void processPayment(double amount) {
    print("Payment processed: $amount");
  }
}

// 2. Mixin Reportable
mixin Reportable {
  String generateReport(String employeeName, String department) {
    return "Report: Monthly report for $employeeName in $department department";
  }
}

// 3. Abstract Class Employee
abstract class Employee {
  String name;
  String id;
  String department;

  Employee(this.name, this.id, this.department);

  // Abstract methods
  String getJobTitle();
  double getBaseSalary();
  void displayInfo();
}

// 4. Concrete Classes:
// Manager extends Employee with both Mixins
class Manager extends Employee with Payable, Reportable {
  int teamSize;

  Manager(String name, String id, String department, this.teamSize)
      : super(name, id, department);

  @override
  String getJobTitle() => "Manager";

  @override
  double getBaseSalary() => 8000.0;

  @override
  void displayInfo() {
    print("Manager: $name (ID: $id, Department: $department, Team Size: $teamSize)");
  }
}

// Developer extends Employee with only Payable Mixin
class Developer extends Employee with Payable {
  String programmingLanguage;

  Developer(String name, String id, String department, this.programmingLanguage)
      : super(name, id, department);

  @override
  String getJobTitle() => "Senior Developer";

  @override
  double getBaseSalary() => 6000.0;

  @override
  void displayInfo() {
    print("Developer: $name (ID: $id, Department: $department, Language: $programmingLanguage)");
  }
}

void main() {
  // 5. Create employees as specified in expected output
  Manager manager = Manager("John Smith", "M001", "IT", 5);
  Developer developer = Developer("Alice Johnson", "D001", "IT", "Dart");

  // Demonstrate Manager functionality
  manager.displayInfo();
  print("Job Title: ${manager.getJobTitle()}");
  print("Base Salary: ${manager.getBaseSalary()}");
  double managerTotal = manager.calculateSalary(manager.getBaseSalary(), 1000.0);
  print("Calculated Salary: $managerTotal");
  manager.processPayment(managerTotal);
  print(manager.generateReport(manager.name, manager.department));

  print(""); // Formatting break

  // Demonstrate Developer functionality
  developer.displayInfo();
  print("Job Title: ${developer.getJobTitle()}");
  print("Base Salary: ${developer.getBaseSalary()}");
  double devTotal = developer.calculateSalary(developer.getBaseSalary(), 500.0);
  print("Calculated Salary: $devTotal");
  developer.processPayment(devTotal);
}
