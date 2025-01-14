USE [SaGoFit+]
GO
/****** Object:  StoredProcedure [dbo].[SP_POST_INSERT]    Script Date: 12/3/2016 11:17:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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

exec [dbo].[SP_POST_INSERT] 'Thuật ngữ cần biết trong tập thể hình' , 'I. CÁC KHÁI NIỆM CHUNG Trong tập thể hình bạn thường nghe khá nhiều tên mà người ta hay nói, vậy liệu các tên đó có gì khác nhau ?',
						'hinh.png', 'folder/image', 700, 'Thanh Huynh', 'CT0001' , 'thanhhuynhsg'