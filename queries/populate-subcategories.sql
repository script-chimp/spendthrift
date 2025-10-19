insert into spendthrift.transaction_category (
	name
)
values	
	-- Income --
	(spendthrift.get_category_id('Income'), 'Salary'),
	(spendthrift.get_category_id('Income'), 'Bonus'),
	(spendthrift.get_category_id('Income'), 'Investment Income'),
	(spendthrift.get_category_id('Income'), 'Interest Income'),
	(spendthrift.get_category_id('Income'), 'Refunds/Reimbursments'),
	(spendthrift.get_category_id('Income'), 'Gifts Received'),
	(spendthrift.get_category_id('Income'), 'Rental Income'),
	(spendthrift.get_category_id('Income'), 'Other Income'),
	
	-- Housing & Utilties --
	(spendthrift.get_category_id('Housing & Utilities'), 'Rent'),
	(spendthrift.get_category_id('Housing & Utilities'), 'Mortgage'),
	(spendthrift.get_category_id('Housing & Utilities'), 'Property Tax'),
	(spendthrift.get_category_id('Housing & Utilities'), 'Homeowner''s Insurance'),
	(spendthrift.get_category_id('Housing & Utilities'), 'Renter''s Insurance'),
	(spendthrift.get_category_id('Housing & Utilities'), 'Home Maintenance'),
	(spendthrift.get_category_id('Housing & Utilities'), 'Electricity'),
	(spendthrift.get_category_id('Housing & Utilities'), 'Water'),
	(spendthrift.get_category_id('Housing & Utilities'), 'Gas/Heating'),
	(spendthrift.get_category_id('Housing & Utilities'), 'Internet'),
	(spendthrift.get_category_id('Housing & Utilities'), 'Phone/Mobile'),
	(spendthrift.get_category_id('Housing & Utilities'), 'Trash'),
	(spendthrift.get_category_id('Housing & Utilities'), 'Utilities'),
	
	-- Transportation --
	(spendthrift.get_category_id('Transportation'), 'Fuel'),
	(spendthrift.get_category_id('Transportation'), 'Car Payment'),
	(spendthrift.get_category_id('Transportation'), 'Car Insurance'),
	(spendthrift.get_category_id('Transportation'), 'Car Maintenance & Repair'),
	(spendthrift.get_category_id('Transportation'), 'Parking'),
	(spendthrift.get_category_id('Transportation'), 'Public Transit'),
	(spendthrift.get_category_id('Transportation'), 'Rideshare'),
	(spendthrift.get_category_id('Transportation'), 'Tolls'),
	
	-- Food & Dining --
	(spendthrift.get_category_id('Food & Dining'), 'Groceries'),
	(spendthrift.get_category_id('Food & Dining'), 'Restaurants'),
	(spendthrift.get_category_id('Food & Dining'), 'Coffee Shops'),
	(spendthrift.get_category_id('Food & Dining'), 'Fast Food'),
	(spendthrift.get_category_id('Food & Dining'), 'Alcohol & Bars'),
	(spendthrift.get_category_id('Food & Dining'), 'Snacks'),
	
	-- Health & Fitness --
	(spendthrift.get_category_id('Health & Fitness'), 'Health Insurance'),
	(spendthrift.get_category_id('Health & Fitness'), 'Medical Bills'),
	(spendthrift.get_category_id('Health & Fitness'), 'Pharmacy'),
	(spendthrift.get_category_id('Health & Fitness'), 'Gym Membership'),
	(spendthrift.get_category_id('Health & Fitness'), 'Dental Care'),
	(spendthrift.get_category_id('Health & Fitness'), 'Vision Care'),
	
	-- Personal & Family
	(spendthrift.get_category_id('Personal & Family'), 'Childcare'),
	(spendthrift.get_category_id('Personal & Family'), 'Eductation/Tuition'),
	(spendthrift.get_category_id('Personal & Family'), 'Books & Supplies'),
	(spendthrift.get_category_id('Personal & Family'), 'Clothing'),
	(spendthrift.get_category_id('Personal & Family'), 'Personal Care'),
	(spendthrift.get_category_id('Personal & Family'), 'Subscriptions'),
	(spendthrift.get_category_id('Personal & Family'), 'Gifts Given'),
	
	-- Entertainment & Leisure --
	(spendthrift.get_category_id('Entertainment & Leisure'), 'Movies/TV'),
	(spendthrift.get_category_id('Entertainment & Leisure'), 'Music'),
	(spendthrift.get_category_id('Entertainment & Leisure'), 'Hobbies'),
	(spendthrift.get_category_id('Entertainment & Leisure'), 'Travel'),
	(spendthrift.get_category_id('Entertainment & Leisure'), 'Sports/Events'),
	(spendthrift.get_category_id('Entertainment & Leisure'), 'Gaming'),
	
	-- Finance & Legal -- 
	(spendthrift.get_category_id('Finance & Legal'), 'Bank Fees'),
	(spendthrift.get_category_id('Finance & Legal'), 'Interest Charges'),
	(spendthrift.get_category_id('Finance & Legal'), 'Credit Card Payments'),
	(spendthrift.get_category_id('Finance & Legal'), 'Loan Payments'),
	(spendthrift.get_category_id('Finance & Legal'), 'Investments'),
	(spendthrift.get_category_id('Finance & Legal'), 'Taxes'),
	(spendthrift.get_category_id('Finance & Legal'), 'Insurance'),
	
	-- Misc. --
	(spendthrift.get_category_id('Miscellaneous'), 'Donations/Charity'),
	(spendthrift.get_category_id('Miscellaneous'), 'Pet Expenses'),
	(spendthrift.get_category_id('Miscellaneous'), 'Miscellaneous/Other')
    ON CONFLICT DO NOTHING;