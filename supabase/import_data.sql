-- Bulk import from Savings.numbers
-- Run this in your Supabase SQL Editor AFTER running migration.sql
-- Requires at least one user to exist in auth.users (sign up first)

-- Insert accounts
INSERT INTO savings.accounts (id, user_id, name, color, display_order)
  VALUES ('08c8b8fa-2014-4678-8d8f-49a63daa4a82', (SELECT id FROM auth.users LIMIT 1), 'Halifax Current', '#00BCD4', 0);
INSERT INTO savings.accounts (id, user_id, name, color, display_order)
  VALUES ('c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', (SELECT id FROM auth.users LIMIT 1), 'Halifax Nasdaq Investment (LRB)', '#4CAF50', 1);
INSERT INTO savings.accounts (id, user_id, name, color, display_order)
  VALUES ('46c8de77-5d8e-4471-96b3-3f7c8c1d2707', (SELECT id FROM auth.users LIMIT 1), 'Fidelity Investments', '#9E9E9E', 2);
INSERT INTO savings.accounts (id, user_id, name, color, display_order)
  VALUES ('17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', (SELECT id FROM auth.users LIMIT 1), 'Chase Savings', '#FF9800', 3);
INSERT INTO savings.accounts (id, user_id, name, color, display_order)
  VALUES ('37882648-e66f-4d29-adc8-db9b3ed30cd5', (SELECT id FROM auth.users LIMIT 1), 'Marcus', '#FFC107', 4);
INSERT INTO savings.accounts (id, user_id, name, color, display_order)
  VALUES ('271b3055-0fd3-40c7-8e7e-42b32b7f44f2', (SELECT id FROM auth.users LIMIT 1), 'Restricted Shares', '#F44336', 5);
INSERT INTO savings.accounts (id, user_id, name, color, display_order)
  VALUES ('47f4c1db-7d90-4fc2-abe3-7db70d29213d', (SELECT id FROM auth.users LIMIT 1), 'Premium Bonds', '#9C27B0', 6);

-- Insert snapshots
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2020-08-01', 5000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2020-10-01', 5500);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2020-11-20', 6084);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2021-02-21', 5425);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2021-04-21', 5536);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2021-07-21', 5620);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2021-10-21', 5494);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2021-12-21', 5557);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2022-02-22', 5845);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2022-04-22', 6587);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2022-07-22', 5000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2022-12-22', 6000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2023-02-01', 10901);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2023-03-01', 6016);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2023-06-23', 5536);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2023-08-23', 5372);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2023-10-23', 5876);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2023-11-23', 7952);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2023-12-23', 7036);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2024-02-24', 5700);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2024-05-24', 6155);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2024-07-24', 5662);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2024-10-24', 5606);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2025-01-25', 7644);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2025-05-25', 5987);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2025-08-25', 5451);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2025-10-25', 12628);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2026-02-26', 7805);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '08c8b8fa-2014-4678-8d8f-49a63daa4a82', '2026-05-26', 2654);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2020-08-01', 2000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2020-10-01', 2623);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2020-11-20', 2965);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2021-02-21', 4161);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2021-04-21', 6190);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2021-07-21', 7682);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2021-10-21', 9876);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2021-12-21', 9700);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2022-02-22', 16989);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2022-04-22', 15483);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2022-07-22', 17743);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2022-12-22', 21314);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2023-02-01', 18241);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2023-03-01', 18241);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2023-06-23', 21512);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2023-08-23', 26360);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2023-10-23', 26582);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2023-11-23', 26582);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2023-12-23', 16814);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2024-02-24', 24575);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2024-05-24', 25239);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2024-07-24', 26645);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2024-10-24', 26960);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2025-01-25', 21207);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2025-05-25', 40800);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2025-08-25', 45000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2025-10-25', 49315);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2026-02-26', 48895);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), 'c28a3aa9-5bc9-41b5-be0a-c940ddafadaf', '2026-05-26', 72161);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2020-08-01', 26000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2020-10-01', 30674);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2020-11-20', 42646);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2021-02-21', 61821);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2021-04-21', 61360);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2021-07-21', 74236);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2021-10-21', 86637);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2021-12-21', 92212);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2022-02-22', 107407);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2022-04-22', 110086);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2022-07-22', 106474);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2022-12-22', 97420);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2023-02-01', 123628);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2023-03-01', 121238);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2023-06-23', 151958);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2023-08-23', 155167);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2023-10-23', 116268);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2023-11-23', 50365);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2023-12-23', 32924);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2024-02-24', 74437);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2024-05-24', 77087);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2024-07-24', 88754);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2024-10-24', 101000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2025-01-25', 110493);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2025-05-25', 137598);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2025-08-25', 156589);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2025-10-25', 171779);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2026-02-26', 192514);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '46c8de77-5d8e-4471-96b3-3f7c8c1d2707', '2026-05-26', 213919);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2020-08-01', 49000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2020-10-01', 40000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2020-11-20', 35700);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2021-02-21', 33730);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2021-04-21', 38759);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2021-07-21', 34395);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2021-10-21', 29239);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2021-12-21', 32285);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2022-02-22', 36802);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2022-04-22', 29025);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2022-07-22', 26934);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2022-12-22', 30033);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2023-02-01', 36086);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2023-03-01', 54231);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2023-06-23', 34426);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2023-08-23', 29600);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2023-10-23', 85881);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2023-11-23', 87175);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2023-12-23', 19438);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2024-02-24', 26583);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2024-05-24', 33053);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2024-07-24', 26762);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2024-10-24', 23033);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2025-01-25', 6100);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2025-05-25', 300);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2025-08-25', 300);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2025-10-25', 143);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2026-02-26', 128);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '17ba2e08-ae11-4ed9-beb8-ec6a4694ed04', '2026-05-26', 120);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2022-02-22', 20000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2022-04-22', 30000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2022-07-22', 28934);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2022-12-22', 27984);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2023-02-01', 39187);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2023-03-01', 37954);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2023-06-23', 39960);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2023-08-23', 40261);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2023-10-23', 15025);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2023-11-23', 80000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2025-01-25', 20000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2025-05-25', 27247);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2025-08-25', 27245);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2025-10-25', 27502);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2026-02-26', 27804);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '37882648-e66f-4d29-adc8-db9b3ed30cd5', '2026-05-26', 62074);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2023-02-01', 6410);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2023-03-01', 6410);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2023-06-23', 14257);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2023-08-23', 15459);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2023-10-23', 14088);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2023-11-23', 14088);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2023-12-23', 15578);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2024-02-24', 21449);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2024-05-24', 22928);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2024-07-24', 24167);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2024-10-24', 24998);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2025-01-25', 34099);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2025-05-25', 37157);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2025-08-25', 39500);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2025-10-25', 39718);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2026-02-26', 45702);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '271b3055-0fd3-40c7-8e7e-42b32b7f44f2', '2026-05-26', 46729);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2023-03-01', 30000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2023-06-23', 49500);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2023-08-23', 49500);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2023-10-23', 49500);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2023-11-23', 49500);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2023-12-23', 500);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2024-02-24', 500);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2024-05-24', 500);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2024-07-24', 500);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2024-10-24', 500);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2025-01-25', 50000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2025-05-25', 10000);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2025-08-25', 50);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2025-10-25', 50);
INSERT INTO savings.snapshots (user_id, account_id, date, amount)
  VALUES ((SELECT id FROM auth.users LIMIT 1), '47f4c1db-7d90-4fc2-abe3-7db70d29213d', '2026-02-26', 40000);
