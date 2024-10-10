--Creat
CREATE PROCEDURE AddMyofficeACPD
    @JsonData NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- �N JSON �ഫ�������
    INSERT INTO Myoffice_ACPD (
								acpd_sid,
								acpd_cname,
								acpd_ename, 
								acpd_sname,
								acpd_email,
								acpd_status,
								acpd_stop,
								acpd_stopMemo,
								acpd_LoginID,
								acpd_LoginPW,
								acpd_memo,
								acpd_nowdatetime,
								appd_nowid,
								acpd_upddatetitme,
								acpd_updid)  
    SELECT 
        JSON_VALUE(@JsonData, '$.acpd_sid'),         
        JSON_VALUE(@JsonData, '$.acpd_cname'),       
        JSON_VALUE(@JsonData, '$.acpd_ename'),       
        JSON_VALUE(@JsonData, '$.acpd_sname'),       
        JSON_VALUE(@JsonData, '$.acpd_email'),       
        JSON_VALUE(@JsonData, '$.acpd_status'),      
        JSON_VALUE(@JsonData, '$.acpd_stop'),        
        JSON_VALUE(@JsonData, '$.acpd_stopMemo'),    
        JSON_VALUE(@JsonData, '$.acpd_LoginID'),    
        JSON_VALUE(@JsonData, '$.acpd_LoginPW'),    
        JSON_VALUE(@JsonData, '$.acpd_memo'),        
        JSON_VALUE(@JsonData, '$.acpd_nowdatetime'), 
        JSON_VALUE(@JsonData, '$.appd_nowid'),       
        JSON_VALUE(@JsonData, '$.acpd_upddatetitme'),
        JSON_VALUE(@JsonData, '$.acpd_updid')   

    SELECT '�ϥΪ̰򥻸�T�Ыئ��\' AS Message;
END;
GO

--Read
CREATE PROCEDURE GetMyofficeACPD
    @acpd_sid NVARCHAR(50) = NULL  -- ��ܩʰѼơA��ǤJ�Ȯɬd�߯S�w�O���A�_�h�d�ߩҦ��O��
AS
BEGIN
    SET NOCOUNT ON;
    IF @acpd_sid IS NOT NULL
    BEGIN
        -- �d�߯S�w�����
        SELECT *
        FROM Myoffice_ACPD
        WHERE acpd_sid = @acpd_sid;

    END
    ELSE
    BEGIN
        -- �d�ߩҦ����
        SELECT *
        FROM Myoffice_ACPD;
    END
END;
Go
--Update
CREATE PROCEDURE UpdateMyofficeACPD
    @JsonData NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Myoffice_ACPD
    SET 
        acpd_cname = JSON_VALUE(@JsonData, '$.acpd_cname'),
        acpd_ename = JSON_VALUE(@JsonData, '$.acpd_ename'),
        acpd_sname = JSON_VALUE(@JsonData, '$.acpd_sname'),
        acpd_email = JSON_VALUE(@JsonData, '$.acpd_email'),
        acpd_status = JSON_VALUE(@JsonData, '$.acpd_status'),
        acpd_stop = JSON_VALUE(@JsonData, '$.acpd_stop'),
        acpd_stopMemo = JSON_VALUE(@JsonData, '$.acpd_stopMemo'),
        acpd_LoginID = JSON_VALUE(@JsonData, '$.acpd_LoginID'),
        acpd_LoginPW = JSON_VALUE(@JsonData, '$.acpd_LoginPW'),
        acpd_memo = JSON_VALUE(@JsonData, '$.acpd_memo'),
        acpd_nowdatetime = JSON_VALUE(@JsonData, '$.acpd_nowdatetime'),
        appd_nowid = JSON_VALUE(@JsonData, '$.appd_nowid'),
        acpd_upddatetitme = JSON_VALUE(@JsonData, '$.acpd_upddatetitme'),
        acpd_updid = JSON_VALUE(@JsonData, '$.acpd_updid')
    WHERE acpd_sid = JSON_VALUE(@JsonData, '$.acpd_sid');

        SELECT '�ϥΪ̰򥻸�T��s���\' AS Message;
END;
Go

--Delete
CREATE PROCEDURE DeleteMyofficeACPD
    @JsonData NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- �q JSON �������n�R�����D�� ID
    DELETE FROM Myoffice_ACPD
    WHERE acpd_sid = JSON_VALUE(@JsonData, '$.acpd_sid');
   
        SELECT '�ϥΪ̰򥻸�T�R�����\' AS Message;
END;
