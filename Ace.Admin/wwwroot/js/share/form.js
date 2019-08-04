function submitForm(callback) {
    var btns = $(parent.document).find(".ui-dialog-buttonpane button");
    var token = $("input[name=__RequestVerificationToken]");
    var opt = {
        close: true,
        type: "POST",
        data: $('form').serialize() + "&__RequestVerificationToken=" + token.val(),
        beforeSend: function () {
            parent.showMask($(document.body), "正在保存...");
            btns.attr('disabled', 'disabled');
        },
        complete: function () {
            parent.removeMask($(document.body));
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
        $.extend(opt, data);
    }
    $.ajax(opt);
};
$.fn.extend({
    initMultiSelect: function (data) {
        var opt = {
            buttonClass: 'btn btn-primary',
            nonSelectedText: "未选择",
            nSelectedText: "项已选择",
            allSelectedText: "已全选"
        };
        $.extend(opt, data);
        this.multiselect(opt);
    }
});