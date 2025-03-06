from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework import status
from .models import AppAccount, Business, Loan, LoanRepayment, Transaction
from .serializers import AppAccountSerializer, BusinessSerializer, LoanSerializer, LoanRepaymentSerializer, TransactionSerializer

class AppAccountViewSet(viewsets.ModelViewSet):
    queryset = AppAccount.objects.all()
    serializer_class = AppAccountSerializer

class BusinessViewSet(viewsets.ModelViewSet):
    queryset = Business.objects.all()
    serializer_class = BusinessSerializer

    def create(self, request, *args, **kwargs):
        # Check if the account exists before creating a business
        account_id = request.data.get("account_id")
        if not AppAccount.objects.filter(account_id=account_id).exists():
            return Response({"error": "Account not found. Create an account first."}, status=status.HTTP_400_BAD_REQUEST)
        
        return super().create(request, *args, **kwargs)

class LoanViewSet(viewsets.ModelViewSet):
    queryset = Loan.objects.all()
    serializer_class = LoanSerializer

class LoanRepaymentViewSet(viewsets.ModelViewSet):
    queryset = LoanRepayment.objects.all()
    serializer_class = LoanRepaymentSerializer

class TransactionViewSet(viewsets.ModelViewSet):
    queryset = Transaction.objects.all()
    serializer_class = TransactionSerializer
