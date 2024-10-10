-- 1. �ŧi�ܼƨӦs�x NewSID �M log �^�ǵ��G
DECLARE @newSID NVARCHAR(20);
DECLARE @logResult NVARCHAR(MAX);
DECLARE @GroupID uniqueidentifier;
SET @GroupID = NEWID();

-- 2. �ͦ��s�� SID
EXEC dbo.NewSID 
    @TableName = N'Myoffice_ACPD',  -- ���w��ƪ�W��
    @ReturnSID = @newSID OUTPUT;    -- ��X�ͦ��� SID

-- 3. ���J�s������ Myoffice_ACPD ��
INSERT INTO [BackendExamHub].[dbo].[Myoffice_ACPD] (
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
    acpd_updid
)
VALUES (
    @newSID,               -- �ϥΥͦ��� SID
    N'�i�T',               -- acpd_cname
    N'John',               -- acpd_ename
    N'Zhang',              -- acpd_sname
    N'john@example.com',   -- acpd_email
    1,                     -- acpd_status
    0,                     -- acpd_stop
    N'',                   -- acpd_stopMemo
    N'john123',            -- acpd_LoginID
    N'password',           -- acpd_LoginPW
    N'�s�Τ�',             -- acpd_memo
    GETDATE(),             -- acpd_nowdatetime
    'admin',               -- appd_nowid
    GETDATE(),             -- acpd_upddatetitme
    'admin'                -- acpd_updid
);

-- 4. �I�s usp_AddLog �O���ާ@

EXEC dbo.usp_AddLog 
    @_InBox_ReadID = 0,                          -- �ϥΪ��� 0
    @_InBox_SPNAME = N'NewSID_Insert',           -- �s�x�L�{�W��
    @_InBox_GroupID = @GroupID,                   -- �ߤ@���s�եN�X
    @_InBox_ExProgram = N'INSERT',               -- �ʧ@�O���J�s����
    @_InBox_ActionJSON = N'{ "action": "Insert new record into Myoffice_ACPD" }', -- ����L�{�� JSON
    @_OutBox_ReturnValues = @logResult OUTPUT;   -- �^�ǵ��G

-- 5. �d�ߵ��G
SELECT @logResult AS 'Log Result';
