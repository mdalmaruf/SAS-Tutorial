libname Mylib 'C:\Users\100XXXX\SAS-Tutorial';

/* Import the Excel file */
proc import datafile="C:\Users\100XXXX\SAS-Tutorial\Accounts.xls"
    out=Mylib.accounts
    dbms=xls
    replace;
    sheet="Prices";
    getnames=yes;
run;

/* Print part of the new data set */
proc print data=Mylib.accounts(obs=10);
title "An overview of Accounts Information";
run;
