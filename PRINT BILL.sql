DECLARE
my_cursor SYS_REFCURSOR;
REC CUSTOMER_ALL_DEATELS%ROWTYPE;
N NUMBER:=0;
BEGIN
    PRINT_BILL(my_cursor);
    LOOP
        FETCH my_cursor INTO REC;
        EXIT WHEN my_cursor%NOTFOUND;
            IF my_cursor%ROWCOUNT = 1 THEN
            DBMS_OUTPUT.PUT_LINE('CUSTOMER ID :-'||REC.COSTOMER_NAME);
            DBMS_OUTPUT.PUT_LINE('ORDER ID :-'||REC.ORDER_ID);
            DBMS_OUTPUT.PUT_LINE('DATE :-'||REC.DATES);
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE('ORDER DEATELS');       
            DBMS_OUTPUT.PUT_LINE('++++++++++++++++++'); 
            END IF;
    DBMS_OUTPUT.PUT_LINE(REC.PRODUCT_NAME||'........'||REC.QUANTITY||'........'||REC.TOTAL_PRISE);
    N:=N+REC.TOTAL_PRISE;
    END LOOP;
DBMS_OUTPUT.PUT_LINE('++++++++++++++++++');
DBMS_OUTPUT.PUT_LINE('TOTAL COST :-               '||N);
END;