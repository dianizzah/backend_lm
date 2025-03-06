-- Menghitung debt to income ratio (param business_id)
SELECT debt_to_income_ratio(3);

-- Menghitung monthly revenue (param business_id)
SELECT monthly_revenue(3);

-- Menghitung skor kredit (param business_id)
SELECT calculate_credit_score(1);

-- Mengupdate rekomendasi kredit (param business_id)
CALL update_credit_recommendation(1);

-- Menghitung outstanding loan (param business_id)
SELECT calculate_outstanding_loan(2);

-- Mengecek status pinjaman (param business_id)
SELECT check_loan_status(1);

-- Mengupdate status pinjaman (param business_id)
CALL update_loan_status(1);
