-- 1. 宣告變數來存儲 NewSID 和 log 回傳結果
DECLARE @newSID NVARCHAR(20);
DECLARE @logResult NVARCHAR(MAX);
DECLARE @GroupID uniqueidentifier;
SET @GroupID = NEWID();

-- 2. 生成新的 SID
EXEC dbo.NewSID 
    @TableName = N'Myoffice_ACPD',  -- 指定資料表名稱
    @ReturnSID = @newSID OUTPUT;    -- 輸出生成的 SID

-- 3. 插入新紀錄到 Myoffice_ACPD 表
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
    @newSID,               -- 使用生成的 SID
    N'張三',               -- acpd_cname
    N'John',               -- acpd_ename
    N'Zhang',              -- acpd_sname
    N'john@example.com',   -- acpd_email
    1,                     -- acpd_status
    0,                     -- acpd_stop
    N'',                   -- acpd_stopMemo
    N'john123',            -- acpd_LoginID
    N'password',           -- acpd_LoginPW
    N'新用戶',             -- acpd_memo
    GETDATE(),             -- acpd_nowdatetime
    'admin',               -- appd_nowid
    GETDATE(),             -- acpd_upddatetitme
    'admin'                -- acpd_updid
);

-- 4. 呼叫 usp_AddLog 記錄操作

EXEC dbo.usp_AddLog 
    @_InBox_ReadID = 0,                          -- 使用版本 0
    @_InBox_SPNAME = N'NewSID_Insert',           -- 存儲過程名稱
    @_InBox_GroupID = @GroupID,                   -- 唯一的群組代碼
    @_InBox_ExProgram = N'INSERT',               -- 動作是插入新紀錄
    @_InBox_ActionJSON = N'{ "action": "Insert new record into Myoffice_ACPD" }', -- 執行過程的 JSON
    @_OutBox_ReturnValues = @logResult OUTPUT;   -- 回傳結果

-- 5. 查詢結果
SELECT @logResult AS 'Log Result';
