# Bài tập 06 - Trần Thị Thu Hà - K225480106009 
# Hệ quản trị CSDL
# Chủ đề: Câu lệnh Select
Yêu cầu bài tập: 
Cho file sv_tnut.sql (1.6MB)
1. Hãy nêu các bước để import được dữ liệu trong sv_tnut.sql vào sql server của em
2. dữ liệu đầu vào là tên của sv; sđt; ngày, tháng, năm sinh của sinh viên (của sv đang làm bài tập này)
3. nhập sql để tìm xem có những sv nào trùng hoàn toàn ngày/tháng/năm với em?
4. nhập sql để tìm xem có những sv nào trùng ngày và tháng sinh với em?
5. nhập sql để tìm xem có những sv nào trùng tháng và năm sinh với em?
6. nhập sql để tìm xem có những sv nào trùng tên với em?
7. nhập sql để tìm xem có những sv nào trùng họ và tên đệm với em.
8. nhập sql để tìm xem có những sv nào có sđt sai khác chỉ 1 số so với sđt của em.
9. BẢNG SV CÓ HƠN 9000 ROWS, HÃY LIỆT KÊ TẤT CẢ CÁC SV NGÀNH KMT, SẮP XẾP THEO TÊN VÀ HỌ ĐỆM, KIỂU TIẾNG  VIỆT, GIẢI THÍCH.
10. HÃY NHẬP SQL ĐỂ LIỆT KÊ CÁC SV NỮ NGÀNH KMT CÓ TRONG BẢNG SV (TRÌNH BÀY QUÁ TRÌNH SUY NGHĨ VÀ GIẢI NHỮNG VỨNG MẮC)

DEADLINE: 23H59:59 NGÀY 25/4/2025
# Bài làm
## 1. Các bước để import dữ liệu trong file sv_tnut.sql vào SQL server
- Bước 1: Đăng nhập vào SQL Server của mình
![image](https://github.com/user-attachments/assets/ca4eec7f-1755-45a2-8f81-0500a748d649)
- Bước 2: Tạo một database mới
![image](https://github.com/user-attachments/assets/39a488ee-4f3d-475e-82f4-557f83651d2e)
- Bước 3: Mở file sv_tnut.sql trong database vừa tạo
![image](https://github.com/user-attachments/assets/a75a4d52-525f-46b6-8838-ba08bb17f133)
- Dữ liệu đã được import vào Database SV_TNUT trong bảng SV
![image](https://github.com/user-attachments/assets/e006c47c-88a5-4f03-ac3a-c9ffc91d56e9)

## 2. Dữ liệu đầu vào là tên của SV, sđt, ngày, tháng, năm sinh của sinh viên: 
- Tên: Hà
- Họ đệm: Trần Thị Thu
- SĐT: 0362995977
- Ngày/tháng/năm sinh: 01/06/2004
## 3. Nhập SQl để tìm xem có sinh viên nào trùng hoàn toàn ngày tháng năm sinh: 
- Câu lệnh SQL để tìm sinh viên trùng hoàn toàn ngày tháng năm sinh:
``` sql
select * from SV
where ns = '2004-06-01'
```
- Kết quả:
![image](https://github.com/user-attachments/assets/1905b17d-2eb9-4627-9990-28aca561d192)

## 4. Nhập SQL để tìm xem có sinh viên nào trùng ngày và tháng sinh: 
- Câu lệnh SQL để tìm sinh viên trùng ngày tháng sinh:
``` sql
select * from SV
where day(ns) = 01 and month(ns) = 6;
```
=> Vì cột ns (ngày sinh) gồm cả ngày tháng năm sinh nên ta phải dùng hàm day() và month() để tách lấy ngày và tháng sinh, không lấy năm sinh
- Kết quả:
![image](https://github.com/user-attachments/assets/22ec42cf-473e-42c0-a962-52b0ed11b25e)

## 5. Nhập SQL để tìm xem có sinh viên nào trùng tháng và năm sinh: 
- Câu lệnh SQL để tìm những sinh viên trùng tháng và năm sinh, sử dụng hàm month() và year():
``` sql
select * from SV
where month(ns) = 06 and year(ns) = 2004;
```
- Kết quả: 
![image](https://github.com/user-attachments/assets/67e9d425-58cb-4838-8673-c7e6842ff8c4)

## 6. Nhập SQL để tìm xem có sinh viên nào trùng tên: 
- Câu lệnh SQL để tìm những sinh viên có cùng tên:
``` sql
select * from SV
where ten = N'Hà';
```
- Kết quả:
![image](https://github.com/user-attachments/assets/d0419cca-e0da-4021-a92f-ab03a22021b5)

## 7. Nhập SQL để tìm xem có sinh viên nào trùng họ và tên đệm: 
- Câu lệnh SQL tìm những sinh viên có cùng họ và tên đệm:
``` sql
select * from SV
where hodem = N'Trần Thị Thu';
```
- Kết quả:
![image](https://github.com/user-attachments/assets/30c99ace-8ef7-44a5-b47b-e1f8e338f23e)

## 8. Nhập SQL để tìm xem có sinh viên nào có sđt sai khác chỉ 1 số với sđt của em: 
- Câu lệnh SQL:
``` sql
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
```
- Kết quả:
![image](https://github.com/user-attachments/assets/6d8be9c0-af31-4e7d-9531-9d3edd26c5eb)

## 9. BẢNG SV CÓ HƠN 9000 ROWS, HÃY LIỆT KÊ TẤT CẢ CÁC SV NGÀNH KMT, SẮP XẾP THEO TÊN VÀ HỌ ĐỆM, KIỂU TIẾNG  VIỆT, GIẢI THÍCH
- Câu lệnh
``` sql
select * from SV
where lop like '%KMT%' OR lop LIKE '%KTP%'
order by 
    ten COLLATE Vietnamese_CI_AS,
    hodem COLLATE Vietnamese_CI_AS;
```
- Giải thích: 'COLLATE Vietnamese_CI_AS' là sắp xếp theo bảng chữ cái tiếng Việt, ví dụ như D sẽ đứng trước Đ và đứng sau C, CI là không phân biệt chữ hoa hay chữ thường, AS là có phân biệt dấu
- Kết quả:
![image](https://github.com/user-attachments/assets/05c3d038-2937-4fb8-943e-4fdd910e03ea)
## 10. HÃY NHẬP SQL ĐỂ LIỆT KÊ CÁC SV NỮ NGÀNH KMT CÓ TRONG BẢNG SV: 
###  Vì dữ liệu trong bảng SV không có cột giới tính để phân biệt giới tính Nam, Nữ nên để liệt kê các SV nữ của ngành KMT thì ta có thể liệt kê theo logic là các SV nữ ở Việt Nam trong tên đệm thường có chữ 'Thị' hoặc 'Thu' hoặc 'Kim' và một số các loại tên thường được đặt cho nữ như 'Hương, Lan, Trang, Linh, Ngọc, Lan, Phương, Huyền' nên ta sẽ dùng các từ khóa này để tìm các sinh viên là nữ của ngành KMT. Cách để tìm giới tính này sẽ có độ chính xác không được cao lắm vì có nhiều tên sẽ được đặt cho cả nam và nữ vì vậy việc dùng họ tên để tìm ra các sinh viên là nữ sẽ có độ chính xác không cao
- Câu lệnh:
``` sql
select * from SV
where  
    (lop like '%KMT%' or lop like '%KTP%')
    AND (
        hodem like '%Thị%' or hodem like '%Thu%' or hodem like '%Kim%' or
        ten in ('Hương', 'Mai', 'Trang', 'Linh', 'Ngọc', 'Lan', 'Phương', 'Huyền')
    );
```
- Kết quả:
![image](https://github.com/user-attachments/assets/91ee10c0-ec59-4d34-b948-4b3a4b673342)

