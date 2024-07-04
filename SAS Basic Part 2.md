# SAS Base Software: SAS Basic Part 2

## Overview

If you have PC database files such as Microsoft Excel spreadsheets, Lotus spreadsheets, or Microsoft Access files, you can use SAS to import these files and create SAS data sets. Once you have the data in SAS data sets, you can process them as needed in SAS. You can also export SAS data to a number of PC file formats.

To read PC database files, you use the `PROC IMPORT` procedure. `PROC IMPORT` reads the input file and writes the data to a SAS data set, with the SAS variables defined based on the input records. You control the results with options and statements that are specific to the input data source.

- `PROC IMPORT` is available only on Windows and UNIX.
- You must have SAS/ACCESS Interface to PC Files licensed to read PC database files. However, even without SAS/ACCESS Interface to PC Files you can import and export delimited external files (files containing columns of data values that are separated by a delimiter such as a blank or a comma).

### Point-and-Click Method

If you have SAS/ACCESS Interface to PC Files licensed, you can import PC database files using the Import Wizard:

1. In SAS, click **File > Import Data**.
2. When the Import Wizard opens, follow directions for importing data.

You can view and save the `PROC IMPORT` code that the Import Wizard generates.

## Example

Suppose that you want to import two files, a Microsoft Excel spreadsheet and a Microsoft Access table. The following programs show you how to read the data using options specific to the given file format, create SAS data sets, and print the new data sets.

```sas
/*********************************************/
/* import the Excel file                     */
/*********************************************/
proc import datafile="c:\myfiles\Accounts.xls"
    out=sasuser.accounts;
    sheet="Prices";
    getnames=no;
run;

/* print part of the new data set */
proc print data=sasuser.accounts(obs=10);
run;

/*********************************************/
/* import the Access file                    */
/*********************************************/
proc import table="customers"
    out=sasuser.cust dbms=access;
    uid="admin";
    pwd="";
    database="c:\myfiles\east.mdb";
    wgdb="c:\winnt\system32\security.mdb";
run;

/* print part of the new data set */
proc print data=sasuser.cust(obs=5);
run;
```

### [IBM DB2 Database](https://www.ibm.com/products/db2-database)
