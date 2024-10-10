DECLARE @GroupID uniqueidentifier;
SET @GroupID = NEWID();
DECLARE @logResult NVARCHAR(MAX);
DECLARE @acpd_sid CHAR(20);
SET @acpd_sid = '0O284359495421600289';

-- 刪除 Myoffice_ACPD 表中的特定記錄
DELETE FROM Myoffice_ACPD
WHERE acpd_sid = @acpd_sid;  -- 根據特定條件（例如 acpd_sid）



-- 執行完查詢後，記錄這次操作
EXEC dbo.usp_AddLog 
    @_InBox_ReadID = 0,                                   -- 使用版本 1
    @_InBox_SPNAME = N'Myoffice_ACPD_Delete',              -- 刪除過程名稱
    @_InBox_GroupID = @GroupID,                    -- 生成唯一識別碼
    @_InBox_ExProgram = N'DELETE',                         -- 動作是刪除
    @_InBox_ActionJSON = N'{ "action": "Delete record from Myoffice_ACPD", "acpd_sid": 0O284359495421600289 }', -- 執行過程的 JSON
    @_OutBox_ReturnValues = @logResult OUTPUT;             -- 回傳結果
--查詢結果
SELECT @logResult AS 'Log Result';