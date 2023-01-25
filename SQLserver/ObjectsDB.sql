USE [DEPORTENIS]
GO
/****** Object:  StoredProcedure [dbo].[DISTIBUTORS_SAVE_SP]    Script Date: 1/25/2023 4:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mirna Ponce de León G.
-- Create date: 25-01-2023
-- Description:	Procedimiento almacenado para guadar distibuidores.
-- =============================================
CREATE PROCEDURE [dbo].[DISTIBUTORS_SAVE_SP]
     @p_id nvarchar(50)
	,@p_name nvarchar(250)
    ,@p_father_last_name nvarchar(250)
    ,@p_mother_last_name nvarchar(250)
	,@p_street nvarchar(250)
    ,@p_number int
    ,@p_neighborhood nvarchar(250)
AS
BEGIN
	
	DECLARE  @v_id nvarchar(50)
			,@v_id_person numeric(18,0)

	IF EXISTS(SELECT 1 FROM DBO.distributors WHERE id = @p_id)
	BEGIN
		

		SET @v_id_person = (SELECT id_person FROM DBO.persons WHERE id_distributor = @p_id)
		
		UPDATE [dbo].[persons]
		   SET 
			   [name] = @P_name
			  ,[father_last_name] = @p_father_last_name
			  ,[mother_last_name] = @p_mother_last_name
			  ,[updated_at] = GETDATE()
		 WHERE 
			id_person = @v_id_person

		
		UPDATE [dbo].[addresses]
		   SET 
			   [street] = @p_street
			  ,[number] = @p_number
			  ,[neighborhood] = @p_neighborhood
			  ,[updated_at] = GETDATE()
		 WHERE 
			id_person = @v_id_person
			

	END
	ELSE
	BEGIN

		DECLARE  @v_number int

		SET @v_number = (SELECT ISNULL(COUNT(id),0) FROM distributors) + 1		

		SET @v_id = 'D000' + CONVERT(varchar,@v_number)
	
		INSERT INTO [dbo].[distributors]
			   ([id]
			   ,[created_at])
		 VALUES
			   (@v_id
			   ,GETDATE())


		INSERT INTO [dbo].[persons]
			   ([id_distributor]
			   ,[name]
			   ,[father_last_name]
			   ,[mother_last_name]
			   ,[created_at])
		 VALUES
			   (@v_id
			   ,@p_name
			   ,@p_father_last_name
			   ,@p_mother_last_name
			   ,GETDATE())

		SET @v_id_person = SCOPE_IDENTITY()

		INSERT INTO [dbo].[addresses]
			   ([id_person]
			   ,[street]
			   ,[number]
			   ,[neighborhood]
			   ,[created_at])
		 VALUES
			   (@v_id_person
			   ,@p_street
			   ,@p_number
			   ,@p_neighborhood
			   ,GETDATE())


	END

END

GO
/****** Object:  StoredProcedure [dbo].[DISTRIBUITOR_GET_SP]    Script Date: 1/25/2023 4:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mirna Ponce de Leon
-- Create date: 25-01-2023
-- Description:	Procedimiento para consultar un distribuidor 
-- =============================================
CREATE PROCEDURE [dbo].[DISTRIBUITOR_GET_SP]
	@p_id nvarchar(50)
AS
BEGIN
		

		SELECT
			 d.id
			,p.name + ' ' + p.father_last_name + ' ' + p.mother_last_name as name_full
			,a.street
			,a.number
			,a.neighborhood
		FROM
			dbo.distributors d
			INNER JOIN dbo.persons p on p.id_distributor = d.id
			INNER JOIN dbo.addresses a on a.id_person = p.id_person
		WHERE
			d.id = @p_id 
END

GO
/****** Object:  Table [dbo].[addresses]    Script Date: 1/25/2023 4:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addresses](
	[id_address] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[id_person] [numeric](18, 0) NOT NULL,
	[street] [nvarchar](250) NOT NULL,
	[number] [int] NOT NULL,
	[neighborhood] [nvarchar](250) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_addresses] PRIMARY KEY CLUSTERED 
(
	[id_address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[distributors]    Script Date: 1/25/2023 4:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distributors](
	[id] [nvarchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_distributors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[persons]    Script Date: 1/25/2023 4:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persons](
	[id_person] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[id_distributor] [nvarchar](50) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[father_last_name] [nvarchar](250) NOT NULL,
	[mother_last_name] [nvarchar](250) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_persons] PRIMARY KEY CLUSTERED 
(
	[id_person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[addresses]  WITH CHECK ADD  CONSTRAINT [FK_addresses_persons] FOREIGN KEY([id_address])
REFERENCES [dbo].[persons] ([id_person])
GO
ALTER TABLE [dbo].[addresses] CHECK CONSTRAINT [FK_addresses_persons]
GO
ALTER TABLE [dbo].[persons]  WITH CHECK ADD  CONSTRAINT [FK_persons_distributors] FOREIGN KEY([id_distributor])
REFERENCES [dbo].[distributors] ([id])
GO
ALTER TABLE [dbo].[persons] CHECK CONSTRAINT [FK_persons_distributors]
GO
