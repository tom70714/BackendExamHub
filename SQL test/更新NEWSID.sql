DECLARE @GroupID uniqueidentifier;
SET @GroupID = NEWID();
DECLARE @logResult NVARCHAR(MAX);
DECLARE @acpd_sid CHAR(20);
SET @acpd_sid = '0O284356820083194416';

-- ��s Myoffice_ACPD �����O��
UPDATE Myoffice_ACPD
SET acpd_cname = '���|',
    acpd_email = 'Leefour@example.com',
    acpd_upddatetitme = GETDATE()
WHERE acpd_sid = @acpd_sid;  -- �ھگS�w����]�Ҧp acpd_sid�^



-- ���槹�d�߫�A�O���o���ާ@
EXEC dbo.usp_AddLog 
    @_InBox_ReadID = 0,                                   -- �ϥΪ��� 1
    @_InBox_SPNAME = N'Myoffice_ACPD_Update',              -- ��s�L�{�W��
    @_InBox_GroupID = @GroupID,                    -- �ͦ��ߤ@�ѧO�X
    @_InBox_ExProgram = N'UPDATE',                         -- �ʧ@�O��s
    @_InBox_ActionJSON = N'{ "action": "Update record in Myoffice_ACPD", "acpd_sid": 0O284356820083194416 }', -- ����L�{�� JSON
    @_OutBox_ReturnValues = @logResult OUTPUT;             -- �^�ǵ��G
--�d�ߵ��G
SELECT @logResult AS 'Log Result';