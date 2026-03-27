create database credit_card_database;

use credit_card_database;

CREATE TABLE credit_card_details (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

CREATE TABLE customer_details (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);
DESCRIBE credit_card_details;

SET GLOBAL local_infile = 1;


LOAD DATA LOCAL INFILE 'D:/Projects/Credit_Card_Analysis/credit_card.csv'
INTO TABLE credit_card_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Client_Num, Card_Category, Annual_Fees, Activation_30_Days, Customer_Acq_Cost,
 @Week_Start_Date, Week_Num, Qtr, current_year, Credit_Limit, Total_Revolving_Bal,
 Total_Trans_Amt, Total_Trans_Ct, Avg_Utilization_Ratio, Use_Chip, Exp_Type,
 Interest_Earned, Delinquent_Acc)
SET Week_Start_Date = STR_TO_DATE(@Week_Start_Date, '%d-%m-%Y');

LOAD DATA LOCAL INFILE 'D:/Projects/Credit_Card_Analysis/customer.csv'
INTO TABLE customer_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Projects/Credit_Card_Analysis/cc_add.csv'
INTO TABLE credit_card_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Client_Num, Card_Category, Annual_Fees, Activation_30_Days, Customer_Acq_Cost,
 @Week_Start_Date, Week_Num, Qtr, current_year, Credit_Limit, Total_Revolving_Bal,
 Total_Trans_Amt, Total_Trans_Ct, Avg_Utilization_Ratio, Use_Chip, Exp_Type,
 Interest_Earned, Delinquent_Acc)
SET Week_Start_Date = STR_TO_DATE(@Week_Start_Date, '%d-%m-%Y');

LOAD DATA LOCAL INFILE 'D:/Projects/Credit_Card_Analysis/cust_add.csv'
INTO TABLE customer_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


select count(*) from credit_card_details;
select * from customer_details;
