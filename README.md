# Getting Started with SAS Studio and SAS Base Software

SAS (Statistical Analysis System) is a powerful software suite used for advanced analytics, business intelligence, data management, and predictive analytics. In this guide, we will walk you through the steps to set up your environment in SAS Studio, create folders, and upload files.

## Setting Up SAS Studio

SAS Studio is a web-based interface to SAS that enables you to write code, run programs, and visualize results. Here’s how to get started:

### Accessing SAS Studio

1. **Login to SAS Studio**:
   Open your browser and navigate to the SAS Studio login page [https://welcome.oda.sas.com/]. Enter your credentials to access the workspace.

### Creating a Folder

To organize your files, you need to create a folder within SAS Studio:

1. **Navigate to Files (Home)**:
   On the left-hand side, under `Server Files and Folders`, locate `Files (Home)`.

2. **Create a New Folder**:
   Right-click on `Files (Home)` and select `New Folder`. Name your folder (e.g., `SAS24`) and click `Save`.

### Uploading Files

Once your folder is created, you can upload files into it:

1. **Select the Folder**:
   Click on the newly created folder (e.g., `SAS24`).

2. **Upload File**:
   Click on the upload icon (or drag and drop your file) to upload files into the selected folder. Choose the file you want to upload (e.g., `Accounts.xls`).

3. **Confirm Upload**:
   After uploading, you should see the file listed under the folder.

![Uploading Files in SAS Studio](screenshots/sas_studio_import.JPG)

### Importing Data

To work with the uploaded data, you need to import it into a SAS dataset:

1. **Select the File**:
   Click on the uploaded file (e.g., `Accounts.xls`).

2. **Import Data**:
   In the right pane, you will see the `Import Data` task. Configure the settings such as the worksheet name and output data set name. Click `Run` to import the data.

3. **View Imported Data**:
   Once the import is complete, you can view the data in the `OUTPUT DATA` tab.



## Using SAS Base Software on Windows

### Open SAS Software:
Launch the SAS software on your Windows machine.

### Create a Library Connected to a Local Folder:
Use the LIBNAME statement to assign a library to a local directory. This will allow you to access and manage datasets stored in that directory.

```sas
/* Assign a library */
libname Mylib 'C:\Users\username\SAS-Tutorial';
```
Replace /username/Accounts.xlsx with the correct path to your uploaded file.


### Ensure the Excel File is Accessible:
Save the `Accounts.xlsx` file to the directory `C:\Users\username\SAS-Tutorial`.

### Import the Excel File:
Open a new SAS program. Use the following code to import the data from the Excel file into the `MyLib` library:

```sas

/* Assign a library */
libname Mylib 'C:\Users\username\SAS-Tutorial';

/* Import the Excel file */
proc import datafile="C:\Users\username\SAS-Tutorial\Accounts.xlsx"
    out=Mylib.accounts
    dbms=xlsx
    replace;
    sheet="Prices";
    getnames=yes;
run;

/* Print part of the new data set */
proc print data=Mylib.accounts(obs=10);
title "An overview of Accounts Information";
run;
```
![Uploading Files in SAS Base](screenshots/sas_base_import.JPG)

### View the Dataset:
In the SAS Explorer window, navigate to `MyLib` and double-click on the `Accounts` dataset to view it.

### Saving SAS Programs:
Saving SAS Programs in the MyLib Directory
If you want to keep your SAS programs and datasets together in the same directory, you can save your `.sas` files to the same location you assigned to `MyLib`. However, note that the SAS libraries (`MyLib`, `Work`, etc.) in the SAS environment are not designed to store .sas program files. Instead, store these files on your local file system and reference them as needed.


To save your SAS program:
1. Go to `File` -> `Save As`.
2. Navigate to the directory you assigned to `MyLib` (e.g., `C:\Users\username\SAS-Tutorial`).
3. Provide a name for your file (e.g., `Program Import.sas`).
4. Click `Save`.

### Example SAS Program
Here’s an example of a simple SAS program:

```sas
/* Step 1: Assign a library */
libname mylib 'C:\Users\username\SAS-Tutorial';

/* Step 2: Import the dataset into MyLib */
proc import datafile='C:\Users\username\SAS-Tutorial\Accounts.xlsx'
    out=Mylib.accounts
    dbms=xlsx
    replace;
    sheet='Prices';
    getnames=yes;
run;

/* Step 3: Print the dataset to confirm the import */
proc print data=Mylib.accounts(obs=10);
title "An overview of Accounts Information";

run;
```
