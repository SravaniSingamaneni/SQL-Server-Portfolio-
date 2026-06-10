CREATE TABLE ExceptionLog
(
    ExceptionId        INT IDENTITY(1,1) PRIMARY KEY,
    ErrorMessage       VARCHAR(4000),
    ErrorProcedure     VARCHAR(200),
    ErrorLine          INT,
    ErrorNumber        INT,
    ErrorSeverity      INT,
    ErrorState         INT,
    InputParameters    NVARCHAR(MAX),
    UserName           VARCHAR(200),
    ErrorDate          DATETIME DEFAULT GETDATE()
);
