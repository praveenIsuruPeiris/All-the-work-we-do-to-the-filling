/*
** @Aurthor: Praveen Jayasuriya Mahathelge
** Date: 15th of March 
** Description: This script alters the already exsisting database tables.
** 
** 
*/
USE [DBAS1-A2-PraveenJ];
GO
-- Rename the REG_IS_PAID column to EARLY_BIRD
ALTER TABLE [REGISTRATION]
ALTER COLUMN [REG_IS_PAID] CHAR(3) NULL;

EXEC sp_RENAME 'REGISTRATION.REG_IS_PAID', 'EARLY_BIRD', 'COLUMN';

-- Modify the EARLY_BIRD column to disallow NULL values and limit its size to 3 characters

ALTER TABLE [REGISTRATION]
ALTER COLUMN [EARLY_BIRD] CHAR(3) NOT NULL;

--This is the alteration of the REGISTRATION table 
-- This comes with constraints to check if this code only has 2 sets of inputs like yes or no
ALTER TABLE [REGISTRATION]
ADD CONSTRAINT [CK_REGISTRATION_EARLY_BIRD] CHECK ([EARLY_BIRD] IN ('Yes', 'No'));
GO

-- this adds a new field that is named as AMOUNT_PAID
ALTER TABLE [REGISTRATION]
ADD [AMOUNT_PAID] DECIMAL(10,2) NULL;

-- End of the scripts.