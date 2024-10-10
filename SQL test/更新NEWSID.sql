DECLARE @GroupID uniqueidentifier;
SET @GroupID = NEWID();
DECLARE @logResult NVARCHAR(MAX);
DECLARE @acpd_sid CHAR(20);
SET @acpd_sid = '0O284356820083194416';

-- 更新 Myoffice_ACPD 表中的記錄
UPDATE Myoffice_ACPD
SET acpd_cname = '李四',
    acpd_email = 'Leefour@example.com',
    acpd_upddatetitme = GETDATE()
WHERE acpd_sid = @acpd_sid;  -- 根據特定條件（例如 acpd_sid）



-- 執行完查詢後，記錄這次操作
EXEC dbo.usp_AddLog 
    @_InBox_ReadID = 0,                                   -- 使用版本 1
    @_InBox_SPNAME = N'Myoffice_ACPD_Update',              -- 更新過程名稱
    @_InBox_GroupID = @GroupID,                    -- 生成唯一識別碼
    @_InBox_ExProgram = N'UPDATE',                         -- 動作是更新
    @_InBox_ActionJSON = N'{ "action": "Update record in Myoffice_ACPD", "acpd_sid": 0O284356820083194416 }', -- 執行過程的 JSON
    @_OutBox_ReturnValues = @logResult OUTPUT;             -- 回傳結果
--查詢結果
SELECT @logResult AS 'Log Result';