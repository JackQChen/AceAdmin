
function showMask(pCtl) {
    var loading = $('#content-Loading');
    loading.offset(pCtl.offset()).width(pCtl.width()).height(pCtl.height());
    loading.find('h4').css('margin-top', (pCtl.height() / 2 - 30) + "px");
    loading.css('display', 'block');
}

function removeMask() {
    $('#content-Loading').offset({ left: 0, top: 0 }).css("display", "none");
}

$("#ace-settings-sidebar").click();
$("#ace-settings-navbar").click();
$("#ace-settings-breadcrumbs").click();

var tabList = new Array();
var tc = $('#tabContent');
//expand first node
$('.nav-list li:eq(0)').addClass('open');
//open tab
function openTab(opt) {
    var tabId = 'tab_' + opt.id;
    var tabUrl = opt.url;
    var tabText = opt.text;
    //tab exist
    if (tabList.indexOf(tabId) > -1) {
        $('#tabHeader li a').each(function (i, o) {
            if ('#' + tabId == $(o).attr('href')) {
                $('#breadcrumbs')[0].scrollLeft = $(o).parent('li')[0].offsetLeft - 1;
                o.click();
            }
        });
        return;
    }
    //add tab
    var th = $("<li><a data-toggle='tab' href=#" + tabId
        + "><i class='green ace-icon fa fa-home bigger-120'/>" + tabText
        + "<i class='ace-icon fa fa-close'/></a></li>");
    $('#tabHeader').append(th);
    $('#breadcrumbs')[0].scrollLeft = th[0].offsetLeft;
    var tb = $("<div id=" + tabId + " class='tab-pane fade active'><iframe class='tab-frame'></iframe></div>");
    tc.append(tb);
    var f = tb.find("iframe");
    f.on('load', function (e) {
        removeMask(e.target);
    });
    f.height($(window).height() - tc.offset().top);
    showMask(f);
    f.attr('src', '/' + tabUrl);
    th.find("a").click();
    tabList.push(tabId);
}
//close tab
function closeTab(ths) {
    ths.each(function (i, o) {
        var th = $(o);
        var tab = $(th.find('a').attr('href'));
        tab.remove();
        if (th.hasClass('active')) {
            if (th.next()[0] == null)
                th.prev().find('a').click();
            else
                th.next().find('a').click();
        }
        th.remove();
        tabList.splice(tabList.indexOf(tab[0].id), 1);
    });
}
$('.nav-list').on('click', '.link', function (e) {
    if ($('#menu-toggler').hasClass('display')) {
        $('#menu-toggler').removeClass('display');
        $('#sidebar').removeClass('display');
    }
    $('.nav-list li').removeClass('active');
    $(e.target).parent('li').addClass('active');
    openTab({
        id: $(e.target).attr('tabId'),
        url: $(e.target).attr('url'),
        text: $(e.target).text()
    });
});
$('#tabHeader').on('click', '.fa-close', function () {
    closeTab($(this).parents('li'));
});
//contextMenu
$('#tabHeader')[0].oncontextmenu = function (e) {
    var e = e || event;
    var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
    $('#tabMenu').css('display', 'block').css('left', e.clientX + "px").css('top', e.clientY + scrollTop + "px");
    return false;
}
$('#tabHeader,#tabMenu li').on('click', function () {
    $('#tabMenu').css('display', 'none');
});
$('.nav-list .link:eq(0)').click();
//override dialog's title function to allow for HTML titles
$.widget("ui.dialog", $.extend({},
    $.ui.dialog.prototype, {
        _title: function (title) {
            var $title = this.options.title || '&nbsp;'
            if (("title_html" in this.options) && this.options.title_html == true)
                title.html($title);
            else
                title.text($title);
        }
    }));

function modalOpen(opt) {
    var editor = $('#dialog-editor');
    var frame = editor.find("iframe");
    frame.contents().find("body").html("");
    frame.attr("src", opt.url);
    if ($(window).width() < 770 || $(window).height() < 650) {
        if (opt.width == null)
            opt.width = $(window).width();
        if (opt.height == null)
            opt.height = $(window).height();
    }
    else {
        if (opt.width == null)
            opt.width = "770";
        if (opt.height == null)
            opt.height = "650";
    }
    frame.height(opt.height - 100);
    var dlgOpt = {
        modal: true,
        width: opt.width,
        height: opt.height,
        title: "<div class='widget-header widget-header-small'><h4 class='smaller' style='line-height: 30px; display: inline;'><i class='fa fa-list-alt'></i> " + opt.title + "</h4></div>",
        title_html: true,
        buttons: [
            {
                html: "<i class='fa fa-check bigger-110'></i>&nbsp; 确定",
                "class": "btn btn-primary btn-minier",
                click: function () {
                    opt.callback();
                }
            },
            {
                html: "<i class='fa fa-close bigger-110'></i>&nbsp; 取消",
                "class": "btn btn-info btn-minier",
                click: function () {
                    $(this).dialog("close");
                }
            }]
    };
    if (opt.view)
        dlgOpt.buttons.splice(0, 1);
    editor.removeClass('hide').dialog(dlgOpt);
}

function modalContent() {
    return $('#dialog-editor iframe')[0].contentWindow;
}

function modalClose() {
    $('#dialog-editor').dialog("close");
}

function modalConfirm(opt) {
    if (opt.title == null)
        opt.title = "提示";
    var dlgOpt = {
        modal: true,
        title: "<div class='widget-header widget-header-small'><h4 class='smaller' style='line-height: 30px; display: inline;'><i class='fa fa-warning red'></i> " + opt.title + "</h4></div>",
        title_html: true,
        buttons: [
            {
                html: "<i class='fa fa-check bigger-110'></i>&nbsp; 是",
                "class": "btn btn-primary btn-minier",
                click: function () {
                    opt.callback();
                }
            },
            {
                html: "<i class='fa fa-close bigger-110'></i>&nbsp; 否",
                "class": "btn btn-info btn-minier",
                click: function () {
                    $(this).dialog("close");
                }
            }]
    };
    $('#dialog-confirm p').text(opt.text);
    $('#dialog-confirm').removeClass('hide').dialog(dlgOpt);
}

function modalConfirmClose() {
    $('#dialog-confirm').dialog("close");
}
