USE [SaGoFit+]
GO
/****** Object:  StoredProcedure [dbo].[POST_ID_AUTO]    Script Date: 12/3/2016 11:19:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[POST_ID_AUTO]
@IDPOST VARCHAR(10) OUTPUT
AS
BEGIN
	DECLARE @MA INT, @NAM VARCHAR(2), @THANG VARCHAR(2)
	SET @NAM = RIGHT(CONVERT(VARCHAR(4), YEAR(GETDATE())),2)
	SET @THANG = RIGHT('0'+ CONVERT(VARCHAR(2), MONTH(GETDATE())), 2)

	IF NOT EXISTS (SELECT 1 FROM POST)
		SET @IDPOST = 'PO' + @NAM + @THANG + '0001'
	ELSE
	BEGIN
		SET @MA = CONVERT(INT, RIGHT((SELECT MAX(RIGHT(ID_POST,4)) FROM POST WHERE 
														SUBSTRING(ID_POST, 3,4) = @NAM+@THANG),4)) + 1
		SET @IDPOST = 'PO'+ @NAM + @THANG + RIGHT('000' + CONVERT(VARCHAR(4), @MA), 4)
	END
END


GO
ALTER PROC [dbo].[SP_POST_INSERT]
@PostName nvarchar(100), 
@PostContent ntext, 
@Image_link varchar(100), 
@Image_list varchar(100), 
@view int,
@Author nvarchar(50),
@CategoriesID varchar(6),
@CreatedBy varchar(10)
AS
BEGIN
	DECLARE @ID VARCHAR(12)
	
	EXEC POST_ID_AUTO @ID OUTPUT

	INSERT INTO POST(ID_POST, PostName, PostContent, Created, Image_link, Image_list, [View], Author, CategoriesID, CreatedBy)
	VALUES (@ID, @PostName, @PostContent, GETDATE(), @Image_link, @Image_list, @view, @Author, @CategoriesID, @CreatedBy)
END