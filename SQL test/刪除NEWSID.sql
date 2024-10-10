DECLARE @GroupID uniqueidentifier;
SET @GroupID = NEWID();
DECLARE @logResult NVARCHAR(MAX);
DECLARE @acpd_sid CHAR(20);
SET @acpd_sid = '0O284359495421600289';

-- �R�� Myoffice_ACPD �����S�w�O��
DELETE FROM Myoffice_ACPD
WHERE acpd_sid = @acpd_sid;  -- �ھگS�w����]�Ҧp acpd_sid�^



-- ���槹�d�߫�A�O���o���ާ@
EXEC dbo.usp_AddLog 
    @_InBox_ReadID = 0,                                   -- �ϥΪ��� 1
    @_InBox_SPNAME = N'Myoffice_ACPD_Delete',              -- �R���L�{�W��
    @_InBox_GroupID = @GroupID,                    -- �ͦ��ߤ@�ѧO�X
    @_InBox_ExProgram = N'DELETE',                         -- �ʧ@�O�R��
    @_InBox_ActionJSON = N'{ "action": "Delete record from Myoffice_ACPD", "acpd_sid": 0O284359495421600289 }', -- ����L�{�� JSON
    @_OutBox_ReturnValues = @logResult OUTPUT;             -- �^�ǵ��G
--�d�ߵ��G
SELECT @logResult AS 'Log Result';