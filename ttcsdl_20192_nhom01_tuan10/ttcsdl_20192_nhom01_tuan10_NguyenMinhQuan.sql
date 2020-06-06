﻿USE ttcsdl_nhom1
-- Nguyễn Minh Quân

-- Cập nhật điểm cho sinh viên
BEGIN TRANSACTION
	UPDATE dbo.LHP_SV SET DiemTX = 5 WHERE id_SV = 1 
	SELECT * FROM dbo.LHP_SV ls
ROLLBACK TRANSACTION

-- Tạo một tài khoản mới khi có sinh viên mới nhập học
INSERT INTO dbo.SinhVien (MaSV,HoTen,NgaySinh,SDT,GioiTinh,BacDaoTao,NgayThem,NgaySua,NgayXoa,TrangThai,id_LopSV,id_CNganh,id_DTUT,id_DanToc,id_TonGiao,id_QuanHuyen,DiaChi,CMND)
VALUES	('16153322', N'Denny Kwan', '2000-04-10', '0358238584', 'Nu', N'Cao đẳng', '2020-04-22 01:12:38', NULL, NULL, 1, 12, 3, NULL, 2, 3, 13, N'Hà Nội', N'013505444')
	
INSERT INTO dbo.TaiKhoan	(MatKhauTK, NgayThem, NgaySua, NgayXoa, TrangThai, id_SV)
VALUES	('denny123', '2020-04-22 01:14:05', NULL, NULL, 1, 20)


-- Thống kê sinh viên lớp học phần
SELECT sv.MaSV, sv.HoTen, sv.NgaySinh, ls2.TenLop
FROM dbo.LopHocPhan lhp, dbo.LHP_SV ls, dbo.SinhVien sv, dbo.LopSV ls2
WHERE lhp.id = ls.id_LHP AND ls.id_SV = sv.id AND sv.id_LopSV = ls2.id
AND lhp.MaLHP = 'MH0101'


---------------------------------
GO

CREATE TRIGGER UTG_CapNhatDiem ON LHP_SV AFTER UPDATE
AS
BEGIN
	DECLARE @MaSV char(8)
	SET @MaSV = (SELECT MaSV FROM dbo.SinhVien sv, dbo.LHP_SV ls WHERE ls.id_SV = sv.id) 
	IF UPDATE (DiemCC)
	PRINT N'Cập nhật điểm chuyên cần cho sinh viên '+@MaSV+' thành công!'
	IF UPDATE (DiemTX)
	PRINT N'Cập nhật điểm thường xuyên cho sinh viên '+@MaSV+' thành công!'
	IF UPDATE (DiemThi)
	PRINT N'Cập nhật điểm thi cho sinh viên '+@MaSV+' thành công!'
	UPDATE LHP_SV
	SET dbo.LHP_SV.NgaySua = GETDATE() WHERE (SELECT id_SV FROM DELETED) = LHP_SV.id_SV
END
GO

UPDATE dbo.LHP_SV SET dbo.LHP_SV.DiemCC = 8.0
WHERE dbo.LHP_SV.id_SV = 1

SELECT * FROM lhp_sv	