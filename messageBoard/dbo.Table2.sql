CREATE TABLE [dbo].[Table]
(
	[msgId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [msgInfo] NVARCHAR(255) NOT NULL, 
    [userId] INT NOT NULL, 
    [dateTime] NVARCHAR(50) NOT NULL
)
