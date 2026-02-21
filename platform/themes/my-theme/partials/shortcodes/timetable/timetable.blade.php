<style>
    .timetable-header {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: #fff;
        border-radius: 1.5rem;
    }

    .form-label small {
        color: #999;
        font-weight: 400;
    }
</style>
<section class="pt-5 mt-5">
    <div class="container">
        <div
            class="timetable-header p-4 p-md-5 mb-4 d-flex flex-column flex-md-row align-items-md-center justify-content-between gap-3">
            <div>
                <h1 class="h3 fw-bold mb-2">Thời khóa biểu</h1>
                <p class="mb-0">Xem lịch học theo ngày / tuần / tháng và thêm môn học nhanh.</p>
            </div>
            <div class="d-flex gap-2">
                <button class="btn btn-light text-primary fw-semibold" id="btnAddEvent" data-bs-toggle="modal"
                        data-bs-target="#addEventModal">
                    <i class="fa fa-plus me-2"></i>Thêm lịch
                </button>
            </div>
        </div>

        <div id="calendar"></div>
    </div>
</section>
<!-- Modal thêm lịch -->
<div class="modal fade" id="addEventModal" tabindex="-1" aria-labelledby="addEventModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content rounded-4">
            <div class="modal-header">
                <h5 class="modal-title fw-bold" id="addEventModalLabel">Thêm môn học / lịch mới</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
            </div>
            <div class="modal-body">
                <form id="eventForm" class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Tên môn học</label>
                        <input type="text" class="form-control" name="title" placeholder="VD: Cấu tạo kiến trúc 2"
                               required>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Phòng</label>
                        <input type="text" class="form-control" name="room" placeholder="VD: M-M13.02">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Giáo viên</label>
                        <input type="text" class="form-control" name="teacher" placeholder="VD: Lê Hồng Mạnh">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Ngày bắt đầu</label>
                        <input type="date" class="form-control" name="start_date" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Ngày kết thúc <small>(nếu lặp)</small></label>
                        <input type="date" class="form-control" name="end_date">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Thứ</label>
                        <select name="weekday" class="form-select">
                            <option value="1">Thứ 2</option>
                            <option value="2">Thứ 3</option>
                            <option value="3">Thứ 4</option>
                            <option value="4">Thứ 5</option>
                            <option value="5">Thứ 6</option>
                            <option value="6">Thứ 7</option>
                            <option value="0">Chủ nhật</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Giờ bắt đầu</label>
                        <input type="time" class="form-control" name="start_time" value="07:00" required>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Giờ kết thúc</label>
                        <input type="time" class="form-control" name="end_time" value="09:40" required>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Màu</label>
                        <input type="color" class="form-control form-control-color" name="color" value="#667eea">
                    </div>
                    <div class="col-md-3 d-flex align-items-end">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="isRecurring"
                                   name="is_recurring" checked>
                            <label class="form-check-label" for="isRecurring">
                                Lặp hàng tuần
                            </label>
                        </div>
                    </div>
                    <div class="col-12">
                        <label class="form-label">Ghi chú</label>
                        <textarea name="note" rows="2" class="form-control"
                                  placeholder="Nội dung ghi chú..."></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer border-0">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" id="saveEventBtn">
                    <i class="fa fa-save me-2"></i>Lưu lịch
                </button>
            </div>
        </div>
    </div>
</div>
