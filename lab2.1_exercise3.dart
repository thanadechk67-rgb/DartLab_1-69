class Employee {
  double calculateSalary() {
    return 0;
  }
}

class FullTimeEmployee extends Employee {
  double monthlySalary;

  FullTimeEmployee(this.monthlySalary);

  @override
  double calculateSalary() {
    return monthlySalary;
  }
}

class PartTimeEmployee extends Employee {
  double hoursWorked;
  double hourlyRate;

  PartTimeEmployee(this.hoursWorked, this.hourlyRate);

  @override
  double calculateSalary() {
    return hoursWorked * hourlyRate;
  }
}

void main() {
  List<Employee> employees = [
    FullTimeEmployee(30000),
    PartTimeEmployee(80, 150),
    FullTimeEmployee(45000),
    PartTimeEmployee(50, 200),
  ];

  for (var employee in employees) {
    print("เงินเดือน: ${employee.calculateSalary()} บาท");
  }
}