# MuaSSL-Trusted-Root-Certificates
Bản sửa lỗi NET::ERR_CERT_AUTHORITY_INVALID dành cho SSL được cấp bởi MuaSSL.com TLS/SSL CA

Tải về và mở tập tin CaiDat.bat để sử dụng, hỗ trợ cả chế độ Admin và User

CentOS 7, Red Hat 7, Oracle Linux 7 hoặc tương đương

Từ CentOS 7, vào thư mục /etc/pki/ca-trust/source/anchors/
Tải về tập tin tại địa chỉ https://raw.githubusercontent.com/haoquangviet/MuaSSL-Trusted-Root-Certificates/e92e86c0decf8c063ab44014e37d98d21b10ff2d/muassl-ca-root-bundle.pem
Chạy lệnh cập nhật
update-ca-trust force-enable (ignore not found warnings)
update-ca-trust extract
