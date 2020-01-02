CREATE TABLE [dbo].[Table]
(
	[musicId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [userId] INT NOT NULL, 
    [musicName] NVARCHAR(50) NOT NULL, 
    [musicAuthor] NVARCHAR(50) NOT NULL, 
    [musicImg] NVARCHAR(50) NOT NULL, 
    [musicUrl] NVARCHAR(50) NOT NULL
)
