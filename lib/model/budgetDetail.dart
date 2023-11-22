class BudgetDetail{
  final String title;
  final String budgetStatus;
  bool planFuture;
  final int budgetAmount;
  final String reason;
  final String date;
  final String notes;

  BudgetDetail({
    required this.title,
    required this.budgetStatus,
    required this.planFuture,
    required this.budgetAmount,
    required this.reason,
    required this.date,
    required this.notes
  });
}