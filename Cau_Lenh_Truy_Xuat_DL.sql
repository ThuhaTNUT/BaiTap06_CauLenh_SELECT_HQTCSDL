-- 3. Câu lệnh tìm xem có sinh viên nào trùng hoàn toàn ngày tháng năm sinh với mình
select * from SV
where ns = '2004-06-01'

-- 4. Câu lệnh để tìm sinh viên trùng ngày và tháng sinh
select * from SV
where day(ns) = 01 and month(ns) = 06;

-- 5. Câu lệnh để tìm sinh viên trùng tháng sinh và năm sinh
select * from SV
where month(ns) = 06 and year(ns) = 2004;

-- 6. Câu lệnh để tìm những sinh viên có cùng tên
select * from SV
where ten = N'Hà';

-- 7. Câu lệnh tìm những sinh viên có cùng họ và ten đệm 
select * from SV
where hodem = N'Trần Thị Thu';

-- 8. Câu lệnh để tìm xem có những sv nào có sđt sai khác chỉ 1 số so với sđt của em.
SELECT *
FROM SV
WHERE 
    LEN(sdt) = LEN('362995977') AND
    (
        SELECT COUNT(*)
        FROM (
            SELECT number 
            FROM master.dbo.spt_values 
            WHERE type = 'P' AND number BETWEEN 1 AND LEN('362995977')
        ) AS x
        WHERE SUBSTRING(SV.sdt, x.number, 1) <> SUBSTRING('968694065', x.number, 1)
    ) = 1;

-- 9. BẢNG SV CÓ HƠN 9000 ROWS, HÃY LIỆT KÊ TẤT CẢ CÁC SV NGÀNH KMT, 
-- SẮP XẾP THEO TÊN VÀ HỌ ĐỆM, KIỂU TIẾNG  VIỆT, GIẢI THÍCH
select * from SV
where lop like '%KMT%' OR lop LIKE '%KTP%'
order by 
    ten COLLATE Vietnamese_CI_AS,
    hodem COLLATE Vietnamese_CI_AS;

-- 10. NHẬP SQL ĐỂ LIỆT KÊ CÁC SV NỮ NGÀNH KMT CÓ TRONG BẢNG SV
select * from SV
where  
    (lop like '%KMT%' or lop like '%KTP%')
    AND (
        hodem like '%Thị%' or hodem like '%Thu%' or hodem like '%Kim%' or
        ten in ('Hương', 'Mai', 'Trang', 'Linh', 'Ngọc', 'Lan', 'Phương', 'Huyền')
    );
