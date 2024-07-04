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
## Creating the Required .mdb Files
If you don't have the database files (`east.mdb` and `security.mdb`), you can create them with the following steps:
### Tools Required

To create and manipulate Microsoft Access databases, you can use:

- **Microsoft Access**: If you have it installed.
- **MDB Viewer Plus**: A free viewer for Microsoft Access database files.
- **DB Browser for SQLite**: An open-source tool to create, design, and edit database files compatible with SQLite.

### Creating the .mdb Files

#### Using Microsoft Access:

1. Open Microsoft Access.
2. Create a new database and save it as `east.mdb`.
3. Create a table named `customers` with fields such as `CustomerID`, `CustomerName`, `ContactName`, `Country`, etc.
4. Save and close the database.
5. Repeat the steps to create `security.mdb` if necessary.

#### Using MDB Viewer Plus:

1. Open MDB Viewer Plus.
2. Create a new database and save it as `east.mdb`.
3. Add a new table named `customers` with the required fields.
4. Save the database.

#### Using DB Browser for SQLite:

1. Open DB Browser for SQLite.
2. Create a new database and save it as `east.mdb`.
3. Add a new table named `customers` with the required fields.
4. Save the database.

#### Sample Data

Here is some sample data you can use for the `customers` table:

| CustomerID | CustomerName                        | ContactName       | Country |
|------------|-------------------------------------|-------------------|---------|
| 1          | Alfreds Futterkiste                 | Maria Anders      | Germany |
| 2          | Ana Trujillo Emparedados y helados  | Ana Trujillo      | Mexico  |
| 3          | Antonio Moreno Taquería             | Antonio Moreno    | Mexico  |
| 4          | Around the Horn                     | Thomas Hardy      | UK      |
| 5          | Berglunds snabbköp                  | Christina Berglund| Sweden  |

#### Note

Ensure the file paths in the `PROC IMPORT` statements are correct and point to the location where you saved your `.mdb` files.

## Installing and Using a Database Management System

To create and manage your databases, you can use either Microsoft Access or DB2. Here are the steps to install and use these tools:

### Option 1: Microsoft Access

#### Installation:

- If you don't have Microsoft Access installed, you can purchase and download it from the Microsoft Store.
- Follow the installation instructions provided by Microsoft.

#### Creating Databases:

1. Open Microsoft Access.
2. Create a new database and save it as `east.mdb`.
3. Create a table named `customers` with the required fields.
4. Save and close the database.
5. Repeat the steps to create `security.mdb` if necessary.

### Option 2: [IBM DB2](https://www.ibm.com/products/db2-database)

#### Installation:

- Download IBM DB2 from the IBM website.
- Follow the installation instructions provided by IBM.

#### Creating Databases:

1. Open the DB2 Command Line Processor.
2. Create a new database:
    ```sql
    CREATE DATABASE east;
    ```
3. Connect to the new database:
    ```sql
    CONNECT TO east;
    ```
4. Create a table named `customers` with the required fields:
    ```sql
    CREATE TABLE customers (
        CustomerID INTEGER,
        CustomerName VARCHAR(100),
        ContactName VARCHAR(100),
        Country VARCHAR(50)
    );
    ```
5. Insert sample data into the table:
    ```sql
    INSERT INTO customers (CustomerID, CustomerName, ContactName, Country) VALUES (1, 'Alfreds Futterkiste', 'Maria Anders', 'Germany');
    INSERT INTO customers (CustomerID, CustomerName, ContactName, Country) VALUES (2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Mexico');
    INSERT INTO customers (CustomerID, CustomerName, ContactName, Country) VALUES (3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mexico');
    INSERT INTO customers (CustomerID, CustomerName, ContactName, Country) VALUES (4, 'Around the Horn', 'Thomas Hardy', 'UK');
    INSERT INTO customers (CustomerID, CustomerName, ContactName, Country) VALUES (5, 'Berglunds snabbköp', 'Christina Berglund', 'Sweden');
    ```

## References

See these online resources to learn more about how to read PC database files.


### [IBM DB2 Database](https://www.ibm.com/products/db2-database)
