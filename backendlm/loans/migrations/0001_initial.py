# Generated by Django 5.1.7 on 2025-03-06 17:39

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AppAccount',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('account_number', models.CharField(max_length=50, unique=True)),
                ('password', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Business',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('business_name', models.CharField(max_length=255)),
                ('owner_name', models.CharField(max_length=255)),
                ('established_year', models.PositiveIntegerField()),
                ('business_type', models.CharField(choices=[('perseorangan', 'perseorangan'), ('badan usaha', 'badan usaha')], max_length=25)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('account_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='loans.appaccount')),
            ],
        ),
        migrations.CreateModel(
            name='Loan',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('loan_amount', models.DecimalField(decimal_places=2, max_digits=15)),
                ('loan_status', models.CharField(choices=[('active', 'active'), ('closed', 'closed'), ('pending', 'pending')], max_length=10)),
                ('credit_score', models.IntegerField()),
                ('risk_level', models.CharField(choices=[('low', 'low'), ('medium', 'medium'), ('high', 'high'), ('very high', 'very high')], max_length=10)),
                ('decision', models.CharField(choices=[('approved', 'approved'), ('rejected', 'rejected')], max_length=10)),
                ('improvement_recommendations', models.TextField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('business', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='loans.business')),
            ],
        ),
        migrations.CreateModel(
            name='LoanRepayment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('payment_amount', models.DecimalField(decimal_places=2, max_digits=15)),
                ('payment_date', models.DateField()),
                ('status', models.CharField(choices=[('on-time', 'on-time'), ('missed', 'missed'), ('late', 'late')], max_length=10)),
                ('business', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='loans.business')),
                ('loan', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='loans.loan')),
            ],
        ),
        migrations.CreateModel(
            name='Transaction',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.DecimalField(decimal_places=2, max_digits=15)),
                ('transaction_type', models.CharField(choices=[('income', 'income'), ('expense', 'expense')], max_length=10)),
                ('transaction_date', models.DateField()),
                ('business', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='loans.business')),
            ],
        ),
    ]
