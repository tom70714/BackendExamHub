DECLARE @GroupID uniqueidentifier;
SET @GroupID = NEWID();
DECLARE @logResult NVARCHAR(MAX);
DECLARE @acpd_sid CHAR(20);
SET @acpd_sid = '0O284356820083194416';

-- �d�� Myoffice_ACPD �����S�w�O��
SELECT *
FROM Myoffice_ACPD
WHERE acpd_sid = @acpd_sid;  -- �ھگS�w����]�Ҧp acpd_sid�^
select * from Myoffice_ExcuteionLog

-- ���槹�d�߫�A�O���o���ާ@

EXEC dbo.usp_AddLog 
    @_InBox_ReadID = 0,                                   -- �ϥΪ��� 1
    @_InBox_SPNAME = N'Myoffice_ACPD_Select',              -- �d�߹L�{�W��
    @_InBox_GroupID = @GroupID,                    -- �ͦ��ߤ@�ѧO�X
    @_InBox_ExProgram = N'SELECT',                         -- �ʧ@�O�d��
    @_InBox_ActionJSON = N'{ "action": "Select record from Myoffice_ACPD", "acpd_sid": 0O284356820083194416 }', -- ����L�{�� JSON
    @_OutBox_ReturnValues = @logResult OUTPUT;             -- �^�ǵ��G

--�d�ߵ��G
SELECT @logResult AS 'Log Result';