# PC Dataset - Data Dictionary

## Overview
This document describes all columns in `dboRaw_pc_Data.csv`, a comprehensive dataset of PC sales transactions across multiple retailers in North America and Africa.

---

## Column Definitions

| Column Name | Data Type | Description | Valid Values | Example |
|---|---|---|---|---|
| Continent | String | Geographic continent | North America, Africa | North America |
| Country or State | String | Country or US state name | Valid country/state names | Texas, Kenya |
| Province or City | String | Province or city name | City/Province names | McKinney, Mombasa |
| Shop Name | String | Retail shop name | Any retailer name | DEF Machines |
| Shop Age | Integer | Number of years the shop has been operating | 1-10 | 7 |
| PC Make | String | Computer manufacturer brand | Asus, HP, Apple, Lenovo, Dell, Microsoft, Samsung, Toshiba, MSI, Acer | Asus |
| PC Model | String | Specific computer model name | Model strings | ROG Strix Scar III |
| Storage Type | String | Primary storage media type | HDD, SSD | HDD |
| Customer Name | String | First name of purchaser | Any customer first name | Michael |
| Customer Surname | String | Last name of purchaser | Any customer surname | Obrien |
| Customer Contact Number | String | Phone number (NEEDS STANDARDIZATION) | Phone number format varies | 8759422956 or (430)332-4476 |
| Customer Email Address | String | Email address (NEEDS VALIDATION) | Valid email format | carterpatricia@example.net |
| Sales Person Name | String | First name of sales representative | Any sales rep name | Ashley |
| Sales Person Surname | String | Last name of sales representative | Any sales rep surname | Wright |
| Sales Type | String | Category of sale | New Sales, Repairs, Returns, Second-hand Sales | New Sales |
| Payment Method | String | How customer paid | Cash, Finance, Bank Transfer | Cash |
| Priority Level | String | Sales priority classification | Low, Medium, High | Low |
| Channel | String | Sales channel used | Online, Offline | Offline |
| Sales Value (Column 19) | Integer | Primary sales amount | Positive integers | 937 |
| Cost Value (Column 20) | Integer | Cost/acquisition price | Positive integers | 18384 |
| Retail Price (Column 21) | Integer | Final retail price | Positive integers | 23384 |
| Sale Date | Date | Date of transaction | YYYY-MM-DD format | 2022-07-17 |
| Warranty Return Date | Date | Warranty claim return date (if applicable) | YYYY-MM-DD or N/A | 2024-02-12 or N/A |
| Warranty Cost (Column 25) | Integer | Cost of warranty claims | 0 or positive integer | 5166 or 0 |
| RAM Size (Column 26) | String | RAM memory amount | 2GB, 4GB, 8GB, 16GB | 16GB |
| Miscellaneous Cost 1 (Column 27) | Integer | Additional cost field 1 | 0 or positive integer | 786 |
| Miscellaneous Cost 2 (Column 28) | Integer | Additional cost field 2 | 0 or positive integer | 3465 |
| Miscellaneous Cost 3 (Column 29) | Integer | Additional cost field 3 | 0 or positive integer | 380 |
| Miscellaneous Value (Column 30) | Integer | Summary miscellaneous value | 0 or positive integer | 22010 |
| Storage Capacity (Column 31) | String | Disk storage amount | 256GB, 512GB, 1TB | 256GB |

---

## Data Quality Issues & Recommendations

### 🔴 **Critical Issues**

1. **Phone Number Format Inconsistency**
   - **Current**: Mixed formats (raw digits, parentheses, extensions, country codes)
   - **Recommendation**: Standardize to E.164 format or digits-only
   - **Examples of issues**: `8759422956`, `(430)332-4476`, `001-627-047-3808x4582`

2. **Missing Values Representation**
   - **Current**: Uses "N/A" string in date and numeric fields
   - **Recommendation**: Use NULL or empty string for consistency
   - **Affected columns**: Warranty Return Date, cost fields

3. **Column Header Truncation**
   - **Current**: CSV display shows `[...]` indicating missing column data
   - **Recommendation**: Export full dataset to verify all columns are included

### 🟡 **Important Issues**

4. **Email Validation**
   - Some entries may be duplicate test emails (example.net, example.com, example.org)
   - Recommendation: Validate email format before database insert

5. **Unnamed Columns**
   - Columns 19-31 lack clear header names
   - Recommendation: Add descriptive header row

6. **Shop Age Range**
   - Values range 1-10 years
   - Recommendation: Clarify if these are actual ages or categories

7. **Currency Not Specified**
   - Numeric values lack currency designation
   - Recommendation: Add currency column (USD, KES, etc.)

### 🟢 **Minor Issues**

8. **Capitalization Inconsistencies**
   - Shop names have mixed casing
   - Recommendation: Standardize to Title Case

9. **Location Data Split**
   - Country/State and Province/City are separate columns
   - Recommendation: Create location hierarchy or geocoding reference

---

## Data Validation Rules

### Required Fields
- Continent
- Country or State
- Shop Name
- PC Make
- PC Model
- Customer Name
- Customer Surname
- Sale Date

### Format Rules
| Field | Rule | Pattern |
|---|---|---|
| Phone Number | Digits only | `^\d{10,15}$` |
| Email | Valid email | `^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$` |
| Sale Date | YYYY-MM-DD | `^\d{4}-\d{2}-\d{2}$` |
| Numeric Fields | Positive integers | `^\d+$` |
| RAM/Storage | Standard format | `^\d+(GB\|TB)$` |

---

## Recommendations for Data Cleanup

### Phase 1: Immediate Fixes
- [ ] Standardize phone numbers (digits only or E.164)
- [ ] Replace all "N/A" with NULL/empty strings
- [ ] Add proper CSV header row with all column names
- [ ] Validate and clean email addresses

### Phase 2: Normalization
- [ ] Create lookup tables for: PC Makes, Shop Names, Sales Types, Payment Methods
- [ ] Standardize case on text fields
- [ ] Add country code mapping (ISO 3166-1)
- [ ] Verify date ranges and fix any invalid dates

### Phase 3: Enhancement
- [ ] Add data quality flags/scores
- [ ] Create audit trail for updates
- [ ] Add currency column
- [ ] Document data sources and collection method
- [ ] Create surrogate keys for lookups

---

## Related Files
- `data_validation_rules.json` - Automated validation rules
- `CLEANING_SCRIPT.py` - Python script to clean the dataset
- `DATA_PROFILE.md` - Statistical analysis of each column

**Last Updated**: 2026-07-02
**Dataset Version**: 1.0 (Raw)
