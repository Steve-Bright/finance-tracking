class BudgetStatusController{

  bool changeBudgetStatus(bool budgetStatus){
    budgetStatus = !budgetStatus;
    return budgetStatus;
  }
}