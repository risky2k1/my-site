$(document).ready(function() {
    $(document).on('click', '.verify-member-email-button', (event) => {
        event.preventDefault()
        $('#confirm-verify-member-email-button').data('action', $(event.currentTarget).prop('href'))
        $('#verify-member-email-modal').modal('show')
    })

    $(document).on('click', '#confirm-verify-member-email-button', (event) => {
        event.preventDefault()
        let _self = $(event.currentTarget)

        _self.addClass('button-loading')

        $.ajax({
            type: 'POST',
            cache: false,
            url: _self.data('action'),
            success: (res) => {
                if (!res.error) {
                    Botble.showSuccess(res.message)
                    setTimeout(() => {
                        window.location.reload()
                    }, 2000)
                } else {
                    Botble.showError(res.message)
                }
                _self.removeClass('button-loading')
                _self.closest('.modal').modal('hide')
            },
            error: (res) => {
                Botble.handleError(res)
                _self.removeClass('button-loading')
            },
        })
    })
})
