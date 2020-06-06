USE ttcsdl_nhom1

GO

								-- Các câu lệnh SQL thực hiện tương ứng với mỗi chức năng của từng thành viên.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Bùi Vinh Hiếu

-- Thông tin cá nhân sinh viên
SELECT	sv.MaSV, sv.HoTen, sv.NgaySinh, sv.GioiTinh, sv.SDT, sv.BacDaoTao,
		dtu.TenDTUT, dt.TenDanToc, tg.TenTonGiao, tp.TenThanhPho, qh.TenQH,
		cn.TenCN, ls.TenLop
FROM	dbo.SinhVien sv, dbo.DoiTuongUT dtu, dbo.DanToc dt, dbo.TonGiao tg, 
		dbo.ThanhPho tp, dbo.QuanHuyen qh, dbo.ChuyenNganh cn, dbo.LopSV ls
WHERE	sv.id_DTUT = dtu.id AND sv.id_DanToc = dt.id AND sv.id_TonGiao = tg.id AND
		sv.id_QuanHuyen = qh.id AND sv.id_CNganh = cn.id AND sv.id_LopSV = ls.id
		AND qh.id_ThanhPho = tp.id AND sv.HoTen = N'Bùi Vinh Liêm'

-- Thống kê điểm, môn học của sinh viên theo từng học kì
SELECT	sv.MaSV, sv.HoTen, lsv.TenLop, mh.MaMH, mh.TenMH, mh.SoTin, hk.TenKi, hk.NamHoc
		,ls.DiemHe10, ls.DiemChu, ls.DiemHe4
FROM	dbo.SinhVien sv, LopSV lsv, dbo.HocKi hk, 
		dbo.LHP_SV ls, dbo.LopHocPhan lhp, dbo.MonHoc mh
WHERE	sv.id = ls.id_SV  AND sv.id_LopSV = lsv.id AND 
		lhp.id_HocKi = hk.id AND mh.id = lhp.id_MonHoc AND sv.MaSV = '16150345'	
-- Ở đây không in ra điểm trung bình vì phần điểm sẽ được code khi lập trình.


-- Cập nhật thông tin gia đình
BEGIN TRANSACTION
	UPDATE dbo.ThanhPhanGiaDinh
	SET HoTenMe = N'Nguyễn Thị Hồng' WHERE id_SV = 2
	SELECT * FROM dbo.ThanhPhanGiaDinh tpgd
ROLLBACK TRANSACTION

-- Cập nhật sĩ số lớp khi sinh viên bị buộc thôi học, bỏ học hoặc chuyển lớp
BEGIN TRANSACTION
	UPDATE dbo.SinhVien SET dbo.SinhVien.TrangThai = 0 WHERE dbo.SinhVien.id = 20
	UPDATE dbo.LopSV SET dbo.LopSV.SiSo = (SiSo - 1) WHERE dbo.LopSV.id = 14
	
	SELECT * FROM dbo.LopSV ls
	SELECT * FROM dbo.SinhVien sv
COMMIT TRANSACTION



