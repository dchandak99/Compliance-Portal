CREATE TABLE [dbo].[TBL_MST_REPO] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [REPO_NAME]     VARCHAR (20)   NOT NULL,
    [STATE]         VARCHAR (20)   NULL,
    [DOCUMENT_NAME] VARCHAR (20)   NULL,
    [DATE]          DATE           NULL,
    [PATH]          VARCHAR (30)   NULL,
    CONSTRAINT [PK_TBL_MST_REPO] PRIMARY KEY CLUSTERED ([ID] ASC)
);

