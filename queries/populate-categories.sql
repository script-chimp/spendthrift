INSERT INTO spendthrift.transaction_category (name)
VALUES
('Uncategorized'),
('Income'),
('Housing & Utilities'),
('Transportation'),
('Food & Dining'),
('Entertainment & Leisure'),
('Health & Fitness'),
('Personal & Family'),
('Shopping'),
('Education'),
('Gifts & Donations'),
('Investments & Savings'),
('Bills & Subscriptions'),
('Government & Legal'),
('Miscellaneous')'
ON CONFLICT DO NOTHING;