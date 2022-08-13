
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/13/2022 11:39:42
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

IF OBJECT_ID(N'[dbo].[FK_CustomerService]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ServiceSet] DROP CONSTRAINT [FK_CustomerService];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorService]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ServiceSet] DROP CONSTRAINT [FK_DoctorService];
GO
IF OBJECT_ID(N'[dbo].[FK_HospitalDoctor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DoctorSet] DROP CONSTRAINT [FK_HospitalDoctor];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[CustomerSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomerSet];
GO
IF OBJECT_ID(N'[dbo].[DoctorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DoctorSet];
GO
IF OBJECT_ID(N'[dbo].[HospitalSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HospitalSet];
GO
IF OBJECT_ID(N'[dbo].[ServiceSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ServiceSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CustomerSet'
CREATE TABLE [dbo].[CustomerSet] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [sex] nvarchar(max)  NOT NULL,
    [birthday] nvarchar(max)  NOT NULL,
    [bloodType] nvarchar(max)  NOT NULL,
    [allergies] nvarchar(max)  NOT NULL,
    [situation] nvarchar(max)  NOT NULL,
    [userId] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ServiceSet'
CREATE TABLE [dbo].[ServiceSet] (
    [id] int IDENTITY(1,1) NOT NULL,
    [price] nvarchar(max)  NOT NULL,
    [content] nvarchar(max)  NOT NULL,
    [score] nvarchar(max)  NOT NULL,
    [date] nvarchar(max)  NOT NULL,
    [Customer_id] int  NOT NULL,
    [Doctor_id] int  NOT NULL
);
GO

-- Creating table 'DoctorSet'
CREATE TABLE [dbo].[DoctorSet] (
    [id] int IDENTITY(1,1) NOT NULL,
    [doctorName] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [description] nvarchar(max)  NOT NULL,
    [score] nvarchar(max)  NOT NULL,
    [Hospital_id] int  NOT NULL,
    [userId] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'HospitalSet'
CREATE TABLE [dbo].[HospitalSet] (
    [id] int IDENTITY(1,1) NOT NULL,
    [hospitalName] nvarchar(max)  NOT NULL,
    [location] nvarchar(max)  NOT NULL,
    [score] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'CustomerSet'
ALTER TABLE [dbo].[CustomerSet]
ADD CONSTRAINT [PK_CustomerSet]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'ServiceSet'
ALTER TABLE [dbo].[ServiceSet]
ADD CONSTRAINT [PK_ServiceSet]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'DoctorSet'
ALTER TABLE [dbo].[DoctorSet]
ADD CONSTRAINT [PK_DoctorSet]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'HospitalSet'
ALTER TABLE [dbo].[HospitalSet]
ADD CONSTRAINT [PK_HospitalSet]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Customer_id] in table 'ServiceSet'
ALTER TABLE [dbo].[ServiceSet]
ADD CONSTRAINT [FK_CustomerService]
    FOREIGN KEY ([Customer_id])
    REFERENCES [dbo].[CustomerSet]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerService'
CREATE INDEX [IX_FK_CustomerService]
ON [dbo].[ServiceSet]
    ([Customer_id]);
GO

-- Creating foreign key on [Doctor_id] in table 'ServiceSet'
ALTER TABLE [dbo].[ServiceSet]
ADD CONSTRAINT [FK_DoctorService]
    FOREIGN KEY ([Doctor_id])
    REFERENCES [dbo].[DoctorSet]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorService'
CREATE INDEX [IX_FK_DoctorService]
ON [dbo].[ServiceSet]
    ([Doctor_id]);
GO

-- Creating foreign key on [Hospital_id] in table 'DoctorSet'
ALTER TABLE [dbo].[DoctorSet]
ADD CONSTRAINT [FK_HospitalDoctor]
    FOREIGN KEY ([Hospital_id])
    REFERENCES [dbo].[HospitalSet]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HospitalDoctor'
CREATE INDEX [IX_FK_HospitalDoctor]
ON [dbo].[DoctorSet]
    ([Hospital_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------