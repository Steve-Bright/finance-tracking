import 'package:get/get.dart';

class CalculationModel{
  RxInt _totalBudgetLeft = RxInt(0);
  RxInt _expenseUsed = RxInt(0);
  RxInt _budgetReceived = RxInt(0);

  int getTotalBudget(){return _totalBudgetLeft.value;}
  int getExpenseUsed(){return _expenseUsed.value;}
  int getBudgetReceived(){return _budgetReceived.value;}

  void setExpenseUsed(int expense){
    _expenseUsed = _expenseUsed + expense;
  }
}