
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/03/2022 12:48:48
-- Generated from EDMX file: D:\cprojects\FIT5032_Labs\final\FIT5032_EcareWebApplication\FIT5032_EcareWebApplication\Models\FIT5032_EcareModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [EcareDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [userId] int IDENTITY(1,1) NOT NULL,
    [userName] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [sex] nvarchar(max)  NOT NULL,
    [birthday] nvarchar(max)  NOT NULL,
    [bloodType] nvarchar(max)  NOT NULL,
    [allergies] nvarchar(max)  NOT NULL,
    [situation] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ServiceSet'
CREATE TABLE [dbo].[ServiceSet] (
    [serviceId] int IDENTITY(1,1) NOT NULL,
    [price] nvarchar(max)  NOT NULL,
    [content] nvarchar(max)  NOT NULL,
    [score] int default(5) NOT NULL,
    [date] nvarchar(max)  NOT NULL,
    [User_userId] int  NOT NULL,
    [Doctor_doctorId] int  NOT NULL
);
GO

-- Creating table 'DoctorSet'
CREATE TABLE [dbo].[DoctorSet] (
    [doctorId] int IDENTITY(1,1) NOT NULL,
    [doctorName] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [description] nvarchar(max)  NOT NULL,
    [score] int default(5)  NOT NULL,
    [Hospital_hospitalId] int  NOT NULL
);
GO

-- Creating table 'HospitalSet'
CREATE TABLE [dbo].[HospitalSet] (
    [hospitalId] int IDENTITY(1,1) NOT NULL,
    [hospitalName] nvarchar(max)  NOT NULL,
    [location] nvarchar(max)  NOT NULL,
    [score] int default(5)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [userId] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([userId] ASC);
GO

-- Creating primary key on [serviceId] in table 'ServiceSet'
ALTER TABLE [dbo].[ServiceSet]
ADD CONSTRAINT [PK_ServiceSet]
    PRIMARY KEY CLUSTERED ([serviceId] ASC);
GO

-- Creating primary key on [doctorId] in table 'DoctorSet'
ALTER TABLE [dbo].[DoctorSet]
ADD CONSTRAINT [PK_DoctorSet]
    PRIMARY KEY CLUSTERED ([doctorId] ASC);
GO

-- Creating primary key on [hospitalId] in table 'HospitalSet'
ALTER TABLE [dbo].[HospitalSet]
ADD CONSTRAINT [PK_HospitalSet]
    PRIMARY KEY CLUSTERED ([hospitalId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [User_userId] in table 'ServiceSet'
ALTER TABLE [dbo].[ServiceSet]
ADD CONSTRAINT [FK_UserService]
    FOREIGN KEY ([User_userId])
    REFERENCES [dbo].[UserSet]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserService'
CREATE INDEX [IX_FK_UserService]
ON [dbo].[ServiceSet]
    ([User_userId]);
GO

-- Creating foreign key on [Doctor_doctorId] in table 'ServiceSet'
ALTER TABLE [dbo].[ServiceSet]
ADD CONSTRAINT [FK_DoctorService]
    FOREIGN KEY ([Doctor_doctorId])
    REFERENCES [dbo].[DoctorSet]
        ([doctorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorService'
CREATE INDEX [IX_FK_DoctorService]
ON [dbo].[ServiceSet]
    ([Doctor_doctorId]);
GO

-- Creating foreign key on [Hospital_hospitalId] in table 'DoctorSet'
ALTER TABLE [dbo].[DoctorSet]
ADD CONSTRAINT [FK_HospitalDoctor]
    FOREIGN KEY ([Hospital_hospitalId])
    REFERENCES [dbo].[HospitalSet]
        ([hospitalId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HospitalDoctor'
CREATE INDEX [IX_FK_HospitalDoctor]
ON [dbo].[DoctorSet]
    ([Hospital_hospitalId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------