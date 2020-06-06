USE ttcsdl_nhom1
-- Sử dụng cơ sở dữ liệu từ lần gửi trước --

GO

		-- Sử dụng PROC trong 2 trường hợp sau thay vì FUNCTION vì ta cần truy xuất ra 1 bảng dữ liệu, ko cần trả về một giá trị cụ thể

-- Thông tin cá nhân sinh viên
CREATE PROC USP_ThongTinSV
@HoTen nvarchar(30)
AS
BEGIN
	SELECT	sv.MaSV, sv.HoTen, sv.NgaySinh, sv.GioiTinh, sv.SDT, sv.BacDaoTao,
			dtu.TenDTUT, dt.TenDanToc, tg.TenTonGiao, tp.TenThanhPho, qh.TenQH,
			cn.TenCN, ls.TenLop
	FROM	dbo.SinhVien sv, dbo.DoiTuongUT dtu, dbo.DanToc dt, dbo.TonGiao tg, 
			dbo.ThanhPho tp, dbo.QuanHuyen qh, dbo.ChuyenNganh cn, dbo.LopSV ls
	WHERE	sv.id_DTUT = dtu.id AND sv.id_DanToc = dt.id AND sv.id_TonGiao = tg.id AND
			sv.id_QuanHuyen = qh.id AND sv.id_CNganh = cn.id AND sv.id_LopSV = ls.id
			AND qh.id_ThanhPho = tp.id AND sv.HoTen = @HoTen
END

EXEC USP_ThongTinSV @HoTen = N'Bùi Vinh Liêm'

GO

-- Thống kê điểm, môn học của sinh viên theo từng học kì
CREATE PROC USP_ThongKeDiemMonHoc
@MaSV char(8)
AS
BEGIN
	SELECT	sv.MaSV, sv.HoTen, lsv.TenLop, mh.MaMH, mh.TenMH, mh.SoTin, hk.TenKi, hk.NamHoc
			,ls.DiemHe10, ls.DiemChu, ls.DiemHe4
	FROM	dbo.SinhVien sv, LopSV lsv, dbo.HocKi hk, 
			dbo.LHP_SV ls, dbo.LopHocPhan lhp, dbo.MonHoc mh
	WHERE	sv.id = ls.id_SV  AND sv.id_LopSV = lsv.id AND 
			lhp.id_HocKi = hk.id AND mh.id = lhp.id_MonHoc AND sv.MaSV = @MaSV
END

GO

EXEC USP_ThongKeDiemMonHoc @MaSv = '16150345'

GO

						-- Sử dụng TRIGGER cho 2 câu truy vấn Cập nhật dữ liệu --

-- Cập nhật thông tin gia đình, tự động thông báo và ngày sửa khi cập nhật thành công
CREATE TRIGGER UTG_CapNhatThongTinGD ON dbo.ThanhPhanGiaDinh AFTER UPDATE
AS
BEGIN
	IF UPDATE (HoTenBo)
	print N'Cập nhật họ tên bố thành công!'
	IF UPDATE (HoTenMe)
	print N'Cập nhật họ tên mẹ thành công!'
	IF UPDATE (SDTBo)
	print N'Cập nhật SĐT bố thành công!'
	IF UPDATE (SDTMe)
	print N'Cập nhật SĐT mẹ thành công!'
	UPDATE dbo.ThanhPhanGiaDinh
	SET dbo.ThanhPhanGiaDinh.NgaySua = GETDATE() WHERE (SELECT id FROM DELETED) = ThanhPhanGiaDinh.id 
END

GO

UPDATE dbo.ThanhPhanGiaDinh
SET dbo.ThanhPhanGiaDinh.SDTBo = '0988080943' WHERE dbo.ThanhPhanGiaDinh.id_SV = 2;

SELECT * FROM dbo.ThanhPhanGiaDinh tpgd


GO 

-- Cập nhật sĩ số lớp khi sinh viên bị buộc thôi học, bỏ học hoặc chuyển lớp
CREATE PROCEDURE USP_CapNhatSiSoLop @MaSV char(8)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @TriggerCode NVARCHAR(max);

  SET @TriggerCode = 'CREATE TRIGGER UTG_CapNhatTrangThaiSV 
	ON dbo.SinhVien AFTER UPDATE
	AS
	BEGIN
		SET NOCOUNT ON 
		UPDATE SinhVien SET dbo.SinhVien.TrangThai = 0 WHERE SinhVien.MaSV = (SELECT d.MaSV FROM DELETED d)
		PRINT N''Đã xóa sinh viên khỏi danh sách lớp.''
	END';

  EXEC(@TriggerCode);
  UPDATE dbo.LopSV
  SET dbo.LopSV.SiSo = dbo.LopSV.SiSo - 1;
  PRINT N'Đã cập nhật sĩ số lớp.'
  RETURN 0;
END

GO 
EXEC USP_CapNhatSiSoLop @MaSV = '16150345' 

