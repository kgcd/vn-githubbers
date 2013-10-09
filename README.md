# vn-githubbers

**vn-githubbers** là một dự án nhỏ do của
[Không gian cộng đồng](http://khonggiancongdong.org/) (KGCĐ), được tạo ra nhằm
thu thập và xây dựng biểu đồ quan hệ người dùng [Github](https://github.com)
Việt Nam.

Bước đầu, dự án này sẽ là nơi để các thành viên KGCĐ luyện tập code, tìm hiểu
một số thuật toán, thử nghiệm một số công nghệ.  Dự án đang được viết bằng
**Ruby**.

## Yêu cầu

* Ruby 1.9

* [Octokit](https://github.com/octokit/octokit.rb) - Ruby toolkit for the
  GitHub API.

## Tính năng

Tìm và hiển thị thông tin:

* Tổng số lượng người dùng Github Việt Nam (có hiển thị trên bản đồ).

* Danh sách 100 người đóng góp nhiều nhất trong 1 năm qua.

* Danh sách 10 ngôn ngữ lập trình sử dụng nhiều nhất và ít nhất.

* Danh sách 20 dự án được starred nhiều nhất.

## Hạn chế

* Do đó cách thức xác định người Việt dựa trên tham số *location* của Github
  profile, người dùng Việt không khai báo location Vietnam sẽ không được thống
  kê vào danh sách.

## Cách thức hoạt động

* Xác định người dùng Việt Nam: *vn-githubbers* dựa trên thông tin *location*
  người dùng khai báo trên Github để xác định.
