
var maskHtml = "<div class='mask-bg' style='\
position:absolute;\
width:100%;\
height:100%;\
left:0px;\
top:0px;\
z-index:13;\
display:flex;\
align-items:center;\
justify-content:center;\
background:rgba(0,0,0,0.1);\
'>\
<h4 class='smaller lighter grey'>\
<i class='ace-icon fa fa-spinner fa-spin orange bigger-125'></i>&nbsp;<span>正在加载...</span>\
</h4>\
</div>";
function showMask(pCtl, maskText, rect) {
    if (pCtl.find('.mask-bg').length > 0)
        return;
    pCtl.append(maskHtml);
    if (!!window.ActiveXObject || "ActiveXObject" in window)
        pCtl.find('.mask-bg').css({ "background-color": "rgba(0, 0, 0, 0.1)", "text-align": "center", "padding-top": "300px" });
    if (rect != null)
        pCtl.find('.mask-bg').offset(rect.offset).width(rect.width).height(rect.height);
    if (maskText != null)
        pCtl.find('.mask-bg span').text(maskText);
}

function removeMask(pCtl) {
    pCtl.find('.mask-bg').remove();
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
        $('#tabHeader a').each(function (i, o) {
            if ('#' + tabId == $(o).attr('href')) {
                $('#breadcrumbs')[0].scrollLeft = $(o).parent('li')[0].offsetLeft - 1;
                o.click();
                return false;
            }
        });
        return;
    }
    //add tab
    var th = $("<li><a data-toggle='tab' href=#" + tabId
        + "><i class='ace-icon fa fa-bars'/>" + tabText
        + "<i class='ace-icon fa fa-close'/></a></li>");
    $('#tabHeader').append(th);
    $('#breadcrumbs')[0].scrollLeft = th[0].offsetLeft;
    var tb = $("<div id=" + tabId + " class='tab-pane fade active'><iframe class='tab-frame'></iframe></div>");
    tc.append(tb);
    var f = tb.find("iframe");
    f.on('load', function (e) {
        removeMask($(e.target.parentElement));
    });
    f.height($(window).height() - tc.offset().top);
    showMask(tb, null, { height: f.height() });
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
