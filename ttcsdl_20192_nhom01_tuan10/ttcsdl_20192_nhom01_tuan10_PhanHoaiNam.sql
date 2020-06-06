USE ttcsdl_nhom1

-- Phan Hoài Nam

-- Thống kê danh sách lớp học phần
SELECT	lhp.MaLHP, lhp.Thu, lhp.ToiDaSV, hk.TenKi, hk.NamHoc, 
		mh.SoTin, mh.SoTiet, ph.MaPhong, gv.HoTen AS N'Giáo Viên', lhp.SiSo
FROM	dbo.LopHocPhan lhp, dbo.LHP_GV lg, dbo.LHP_SV ls,
		dbo.PhongHoc ph, dbo.MonHoc mh, dbo.HocKi hk, dbo.GiaoVien gv
WHERE	lhp.id_HocKi = hk.id AND lhp.id_PhongHoc = ph.id AND lhp.id_MonHoc = mh.id
		AND lg.id_GV = gv.id AND lg.id_LHP = lhp.id

-- Cập nhật sĩ số lớp học phần khi sinh viên đăng ký/hủy môn học đó
BEGIN TRANSACTION
	DELETE FROM dbo.LHP_SV WHERE dbo.LHP_SV.id_SV = 8
	UPDATE dbo.LopHocPhan SET SiSo = (SiSo - 1) WHERE dbo.LopHocPhan.id = 4
	SELECT lhp.siso FROM dbo.LopHocPhan lhp WHERE lhp.id = 4
COMMIT TRANSACTION
-- Cập nhật	thông tin giáo viên
BEGIN TRANSACTION
	UPDATE dbo.GiaoVien
	SET dbo.GiaoVien.BacHam = N'Đại Tá' WHERE dbo.GiaoVien.HoTen = N'Trần Mai Loan'
	SELECT * FROM dbo.GiaoVien gv WHERE gv.HoTen = N'Trần Mai Loan'
ROLLBACK TRANSACTION
