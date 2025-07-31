$(document).ready(function () {
    const $province = $('select[name="province_id"]');
    const $district = $('select[name="district_id"]');
    const $ward = $('select[name="ward_id"]');

    console.log($province)
    $province.on('change', function () {
        const provinceId = $(this).val();
        $district.val(null).trigger('change');
        $ward.val(null).trigger('change');

        // Update ajax url for district
        $district.select2({
            ajax: {
                url: '/administrative-unit/ajax/districts?province_id=' + provinceId,
                dataType: 'json',
                processResults: function (data) {
                    return {
                        results: data
                    };
                }
            }
        });
    });

    $district.on('change', function () {
        const districtId = $(this).val();
        $ward.val(null).trigger('change');

        // Update ajax url for ward
        $ward.select2({
            ajax: {
                url: '/administrative-unit/ajax/wards?district_id=' + districtId,
                dataType: 'json',
                processResults: function (data) {
                    return {
                        results: data
                    };
                }
            }
        });
    });
});
