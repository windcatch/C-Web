CREATE TABLE [dbo].[msgInfo] (
    [msgId]    INT            IDENTITY (1, 1) NOT NULL,
    [msgCon]  NVARCHAR (255) NOT NULL,
    [userName]   NVARCHAR(50)            NOT NULL,
    [dateTime] NVARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([msgId] ASC)
);

