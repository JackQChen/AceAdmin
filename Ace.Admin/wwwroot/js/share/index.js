
//replace icons with FontAwesome icons like above
function updatePagerIcons() {
    var replacement = {
        'ui-icon-seek-first': 'fa fa-angle-double-left bigger-140',
        'ui-icon-seek-prev': 'fa fa-angle-left bigger-140',
        'ui-icon-seek-next': 'fa fa-angle-right bigger-140',
        'ui-icon-seek-end': 'fa fa-angle-double-right bigger-140'
    };
    $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function () {
        var icon = $(this);
        var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
        if ($class in replacement)
            icon.attr('class', 'ui-icon ' + replacement[$class]);
    })
}

function getGridOption(grid_selector, pager_selector, option) {
    var opt = {
        mtype: "POST",
        datatype: "json",
        height: $(document).height() - $(grid_selector).offset().top - 97,
        rowNum: 10,
        rowList: [10, 15, 30],
        viewrecords: true,
        pager: pager_selector,
        autowidth: true,
        loadComplete: function () {
            setTimeout(function () { updatePagerIcons(); }, 0);
            var ids = $(grid_selector).getDataIDs();
            if (ids.length > 0)
                $(grid_selector).setSelection(ids[0]);
        }
    };
    return Object.assign(opt, option);
}

function modalOpen(opt) {
    parent.modalOpen(opt);
}

function modalContent() {
    return parent.modalContent();
}

function modalClose() {
    parent.modalClose();
}

function modalConfirm(opt) {
    parent.modalConfirm(opt);
}

function modalConfirmClose() {
    parent.modalConfirmClose();
}

function deleteForm(arg) {
    var token = $("input[name=__RequestVerificationToken]");
    arg.type = "POST";
    arg.data = "__RequestVerificationToken=" + token.val();
    $.ajax(arg);
};