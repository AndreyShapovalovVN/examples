
CREATE USER C##UXPCLIENT IDENTIFIED BY UXPCLIENT;
GRANT CONNECT, RESOURCE TO C##UXPCLIENT;
GRANT UNLIMITED TABLESPACE TO C##UXPCLIENT;

quit;