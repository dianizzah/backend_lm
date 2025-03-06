from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import AppAccountViewSet, BusinessViewSet, LoanViewSet, LoanRepaymentViewSet, TransactionViewSet

router = DefaultRouter()
router.register(r'accounts', AppAccountViewSet)
router.register(r'businesses', BusinessViewSet)
router.register(r'loans', LoanViewSet)
router.register(r'loan-repayments', LoanRepaymentViewSet)
router.register(r'transactions', TransactionViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
