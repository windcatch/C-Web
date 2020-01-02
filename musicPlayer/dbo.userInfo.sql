CREATE TABLE [dbo].[Table] (
    [userId]   INT          IDENTITY (1, 1) NOT NULL,
    [username] VARCHAR (50) NOT NULL,
    [password] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([userId] ASC)
);

