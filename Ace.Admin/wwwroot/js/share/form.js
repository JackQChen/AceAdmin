function submitForm(callback) {
    var btns = $(parent.document).find(".ui-dialog-buttonpane button");
    var token = $("input[name=__RequestVerificationToken]");
    var opt = {
        close: true,
        type: "POST",
        data: $('form').serialize() + "&__RequestVerificationToken=" + token.val(),
        beforeSend: function () {
            $('#divLoading').css("display", "block");
            btns.attr('disabled', 'disabled');
        },
        complete: function () {
            $('#divLoading').css("display", "none");
            btns.removeAttr('disabled');
            if (this.close) {
                parent.modalClose();
                if (callback != null)
                    callback();
            }
        }
    };
    if (typeof submitData == 'function') {
        var data = submitData();
        Object.assign(opt, data);
    }
    $.ajax(opt);
};
function initMultiSelect() {
    $('.multiselect').multiselect({
        buttonClass: 'btn btn-primary',
        nonSelectedText: "未选择",
        nSelectedText: "项已选择",
        allSelectedText: "已全选"
    });
}