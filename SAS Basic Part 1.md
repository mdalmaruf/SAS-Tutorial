# Basic Tools Part 1

## Example 1: Creating and Printing a Data Set
- Using SAS Studio
- Log in to SAS Studio[https://welcome.oda.sas.com/]:
- Go to the SAS OnDemand for Academics website.
- Log in with your credentials.


### Define SAS Library
Use the LIBNAME statement to define a SAS library.

```sas
/* define SAS library */
libname sales 'c:\salesdata\sas\2002';
```
You should have this valid path (c:\salesdata\sas\2002) at your local folder.

### Create New Data Set from Raw Data
Use a DATA step to create a new data set.
```sas
/* create new data set from raw data */
data sales.quarter1;
   length Department $ 7 Site $ 8;
   input Department Site Quarter Sales;
   datalines;
Parts       Sydney   1   4043.97
Parts       Atlanta  1   6225.26
Parts       Paris    1   3543.97
Repairs     Sydney   1   5592.82
Repairs     Atlanta  1   9210.21
Repairs     Paris    1   8591.98
Tools       Sydney   1   1775.74
Tools       Atlanta  1   2424.19
Tools       Paris    1   5914.25
;
run;

```

### Print New Data Set
Use PROC PRINT to print the new data set.
```sas
/* print new data set */
proc print data=sales.quarter1;
run;
```

### Print Existing Data Set
Use PROC PRINT to print an existing data set.

```sas
/* print existing data set */
proc print data=mylib.productsales;
run;
```

## Example 2: Assigning a Libref to Reference DBMS Data
### Define SAS Library for Oracle
Use the LIBNAME statement to define a SAS library for Oracle.
```sas
/* define SAS library for Oracle */
libname myorclib oracle user=scott password=tiger
   path="blunzer:v7" schema=hrdept;
```
### Define SAS Library for DB2
Use the LIBNAME statement to define a SAS library for DB2
```sas
/* define SAS library for DB2 */
libname mydblib db2
   noprompt="user=testuser;
   password=testpass;database=testdb";

```
### Print Oracle Table
Use PROC PRINT to print an Oracle table.
```sas
/* print Oracle table */
proc print data=myorclib.all_employees;
   where state='CA';
run;

```
### Print DB2 Table
Use PROC PRINT to print a DB2 table.
```sas
/* print DB2 table */
proc print data=mydblib.customers;
   where state='CA';
run;

```
### Clear Librefs
Use the LIBNAME statement to clear librefs.
```sas
/* clear librefs */
libname myorclib clear;
libname mydblib clear;
```

