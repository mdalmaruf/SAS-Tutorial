# Getting Started with SAS Studio and SAS Base Software

SAS (Statistical Analysis System) is a powerful software suite used for advanced analytics, business intelligence, data management, and predictive analytics. In this guide, we will walk you through the steps to set up your environment in SAS Studio, create folders, and upload files.

## Setting Up SAS Studio

SAS Studio is a web-based interface to SAS that enables you to write code, run programs, and visualize results. Here’s how to get started:

### Accessing SAS Studio

1. **Login to SAS Studio**:
   Open your browser and navigate to the SAS Studio login page. Enter your credentials to access the workspace.

### Creating a Folder

To organize your files, you need to create a folder within SAS Studio:

1. **Navigate to Files (Home)**:
   On the left-hand side, under `Server Files and Folders`, locate `Files (Home)`.

2. **Create a New Folder**:
   Right-click on `Files (Home)` and select `New Folder`. Name your folder (e.g., `SAS24`) and click `Save`.

![Creating a Folder in SAS Studio](path/to/your/image.png)

### Uploading Files

Once your folder is created, you can upload files into it:

1. **Select the Folder**:
   Click on the newly created folder (e.g., `SAS24`).

2. **Upload File**:
   Click on the upload icon (or drag and drop your file) to upload files into the selected folder. Choose the file you want to upload (e.g., `Accounts.xls`).

3. **Confirm Upload**:
   After uploading, you should see the file listed under the folder.

![Uploading Files in SAS Studio](path/to/your/image.png)

### Importing Data

To work with the uploaded data, you need to import it into a SAS dataset:

1. **Select the File**:
   Click on the uploaded file (e.g., `Accounts.xls`).

2. **Import Data**:
   In the right pane, you will see the `Import Data` task. Configure the settings such as the worksheet name and output data set name. Click `Run` to import the data.

3. **View Imported Data**:
   Once the import is complete, you can view the data in the `OUTPUT DATA` tab.

![Imported Data in SAS Studio](path/to/your/image.png)

## Working with SAS Base Software

SAS Base is the foundational software for SAS and includes essential tools for data management and analytics.

### Writing SAS Programs

To create and run SAS programs, follow these steps:

1. **Open a New Program**:
   In SAS Studio, click on the `New` icon and select `Program`.

2. **Write Your Code**:
   Write your SAS code in the editor. For example, you can start with a simple data step:

   ```sas
   data work.example;
      input Name $ Age;
      datalines;
   John 25
   Jane 30
   ;
   run;

   proc print data=work.example;
   run;
