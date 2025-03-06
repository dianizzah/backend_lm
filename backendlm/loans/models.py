from django.db import models

# Account Model
class AppAccount(models.Model):
    account_number = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=255)

# Business Model
class Business(models.Model):
    BUSINESS_TYPES = (
        ('perseorangan', 'perseorangan'),
        ('badan usaha', 'badan usaha'),
    )
    business_name = models.CharField(max_length=255)
    owner_name = models.CharField(max_length=255)
    established_year = models.PositiveIntegerField()
    business_type = models.CharField(max_length=25, choices=BUSINESS_TYPES)
    created_at = models.DateTimeField(auto_now_add=True)
    account_id = models.ForeignKey(AppAccount, on_delete=models.CASCADE)

# Transactions Model
class Transaction(models.Model):
    TRANSACTION_TYPES = (
        ('income', 'income'),
        ('expense', 'expense'),
    )
    business = models.ForeignKey(Business, on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=15, decimal_places=2)
    transaction_type = models.CharField(max_length=10, choices=TRANSACTION_TYPES)
    transaction_date = models.DateField()

# Loans Model
class Loan(models.Model):
    LOAN_STATUS = (
        ('active', 'active'),
        ('closed', 'closed'),
        ('pending', 'pending'),
    )
    RISK_LEVELS = (
        ('low', 'low'),
        ('medium', 'medium'),
        ('high', 'high'),
        ('very high', 'very high'),
    )
    DECISION = (
        ('approved', 'approved'),
        ('rejected', 'rejected')
    )
    business = models.ForeignKey(Business, on_delete=models.CASCADE)
    loan_amount = models.DecimalField(max_digits=15, decimal_places=2)
    loan_status = models.CharField(max_length=10, choices=LOAN_STATUS)
    credit_score = models.IntegerField()
    risk_level = models.CharField(max_length=10, choices=RISK_LEVELS)
    decision = models.CharField(max_length=10, choices=DECISION)
    improvement_recommendations = models.TextField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

# Loan Repayments Model
class LoanRepayment(models.Model):
    STATUS_CHOICES = (
        ('on-time', 'on-time'),
        ('missed', 'missed'),
        ('late', 'late'),
    )
    loan = models.ForeignKey(Loan, on_delete=models.CASCADE)
    business = models.ForeignKey(Business, on_delete=models.CASCADE)
    payment_amount = models.DecimalField(max_digits=15, decimal_places=2)
    payment_date = models.DateField()
    status = models.CharField(max_length=10, choices=STATUS_CHOICES)
