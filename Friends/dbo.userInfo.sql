CREATE TABLE [dbo].[Table]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [username] NVARCHAR(50) NOT NULL, 
    [password] NVARCHAR(50) NOT NULL, 
    [friendsNames] NVARCHAR(MAX) NOT NULL
)
