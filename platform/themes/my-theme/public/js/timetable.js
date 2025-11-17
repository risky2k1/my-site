document.addEventListener('DOMContentLoaded', function () {
    const calendarEl = document.getElementById('calendar');

    // Khởi tạo lịch
    const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        locale: 'vi',
        selectable: true,
        editable: false,
        height: 'auto',

        events: function (fetchInfo, successCallback, failureCallback) {
            $.get('/timetable/events', function (res) {
                if (!Array.isArray(res)) return;

                const expandedEvents = [];

                res.forEach(event => {
                    // Nếu không lặp, push nguyên event
                    if (!event.extendedProps?.is_recurring || !event.extendedProps?.end_date) {
                        expandedEvents.push(event);
                        return;
                    }

                    // Nếu có lặp hàng tuần -> nhân ra theo tuần
                    const start = new Date(event.extendedProps.start_date);
                    const end = new Date(event.extendedProps.end_date);
                    const weekday = parseInt(event.extendedProps.weekday, 10);

                    for (let d = new Date(start); d <= end; d.setDate(d.getDate() + 1)) {
                        if (d.getDay() === weekday) {
                            const dateStr = d.toISOString().split('T')[0];
                            expandedEvents.push({
                                title: event.title,
                                start: dateStr + 'T' + event.extendedProps.start_time,
                                end: dateStr + 'T' + event.extendedProps.end_time,
                                backgroundColor: event.color || '#667eea',
                                borderColor: event.color || '#667eea',
                                extendedProps: event.extendedProps,
                            });
                        }
                    }
                });

                successCallback(expandedEvents);
            }).fail(() => failureCallback());
        },

        eventClick: function (info) {
            const room = info.event.extendedProps.room ? `\nPhòng: ${info.event.extendedProps.room}` : '';
            const teacher = info.event.extendedProps.teacher ? `\nGV: ${info.event.extendedProps.teacher}` : '';
            const note = info.event.extendedProps.note ? `\nGhi chú: ${info.event.extendedProps.note}` : '';
            alert(`${info.event.title}${room}${teacher}${note}`);
        }
    });

    calendar.render();

    // 🔹 Lưu sự kiện mới
    $('#saveEventBtn').on('click', function () {
        const form = $('#eventForm');
        const data = {
            title: form.find('[name="title"]').val(),
            room: form.find('[name="room"]').val(),
            teacher: form.find('[name="teacher"]').val(),
            start_date: form.find('[name="start_date"]').val(),
            end_date: form.find('[name="end_date"]').val(),
            weekday: parseInt(form.find('[name="weekday"]').val(), 10),
            start_time: form.find('[name="start_time"]').val(),
            end_time: form.find('[name="end_time"]').val(),
            color: form.find('[name="color"]').val(),
            note: form.find('[name="note"]').val(),
            is_recurring: form.find('[name="is_recurring"]').is(':checked') ? 1 : 0,
            _token: $('meta[name="csrf-token"]').attr('content'),
        };

        if (!data.title || !data.start_date || !data.start_time || !data.end_time) {
            toastr.warning('Vui lòng nhập đầy đủ thông tin!');
            return;
        }

        $.ajax({
            url: '/timetable/store',
            type: 'POST',
            data: data,
            success: function (res) {
                if (res.success) {
                    toastr.success('Đã lưu lịch thành công!');
                    $('#addEventModal').modal('hide');
                    form[0].reset();
                    calendar.refetchEvents();
                } else {
                    toastr.error('Không thể lưu lịch!');
                }
            },
            error: function (xhr) {
                toastr.error('Lỗi khi lưu lịch!');
                console.error(xhr.responseText);
            }
        });
    });

});
