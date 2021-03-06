-- Cách lấy dữ liệu trong Database MISA
-- Mỗi báo cáo sẽ có 1 Proc để lấy ra dữ liệu cho báo cáo đó
-- Hướng đi là dùng Proc để lấy dữ liệu cho báo cáo


-- Các bước cần thực hiện
-- Tạo bảng chứa các biến của Proc
-- Thêm mã chèn các biến vào bảng chứa các biến của Proc
-- Vào phần mềm MISA đổ ra báo cáo mong muốn
-- (Khi đổ báo cáo bằng MISA thì phần mềm sẽ sử dụng Proc)
-- Vào kiểm tra bảng chứa biến của Proc, tìm hiểu để lấy được dữ liệu mong muốn

-- Lấy Proc theo báo cáo
SELECT ReportName, ProcedureName
FROM SYSReportList
ORDER BY ReportName ASC

-- bảng sổ nhật ký chung, nếu có nghiệp vụ kế toán thì dùng bảng này để phân tích ra thành các báo cáo
-- khỏi cần lấy từng báo cáo theo Proc
SELECT * FROM GeneralLedger
