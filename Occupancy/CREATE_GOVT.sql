﻿CREATE TABLE [dbo].[TBL_MST_GOVT_CASES] (
    [ID]               INT        IDENTITY (1, 1) NOT NULL,
    [ACCOUNT]          VARCHAR (20) NULL,
    [CASE_NAME]        VARCHAR (20) NOT NULL,
    [CASE_DATE]        DATE NULL,
    [ACT]              VARCHAR (20) NULL,
    [DEPARTMENT]       VARCHAR (20) NULL,
    [STATUS]           VARCHAR (20) NULL,
    [CASE_DETAILS]     VARCHAR (1000) NOT NULL,
    CONSTRAINT [PK_TBL_MST_GOVT_CASES] PRIMARY KEY CLUSTERED ([ID] ASC)
);