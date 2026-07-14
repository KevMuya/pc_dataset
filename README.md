# PC Dataset Analysis

This repository contains a raw PC sales dataset and a SQL analysis script.

## Files

- `cash_crusader_raw_pc_data` — raw dataset with PC sales, shop details, customer records, and transaction metrics.
- `pc_data_analysis.sql` — SQL queries for basic analysis of the dataset.

## Dataset Summary

The dataset includes:

- Location and shop details: continent, country/state, city/province, shop name, shop age.
- PC product information: brand, model, storage type, storage capacity, RAM, and market price.
- Customer information: first name, surname, contact number, and email address.
- Sales details: sales person, department, payment method, sales channel, price, discount, finance amount, purchase date, ship date, and repair costs.

## How to use

1. Import `cash_crusader_raw_pc_data` into your SQL database or analysis tool.
2. Run the queries in `pc_data_analysis.sql` against the imported table `cash_crusader_raw_pc_data`.

## Notes

- The dataset contains personal contact information. Verify that the data is safe to publish before sharing publicly.
- The SQL script is written for use with a database that supports quoted identifiers (like PostgreSQL).
