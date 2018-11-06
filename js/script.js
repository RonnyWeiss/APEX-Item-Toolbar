function itemToolbar(self, type) {
    "use strict";
    var scriptVersion = "1.2.2";

    $.each($(self.affectedElements), function (i, item) {

        if ($(item).is("textarea") || $(item).attr("type") == "text") {

            var itemInputContainer = $(item).closest("div.t-Form-inputContainer");

            var smileyArr = ["&#128513;",
            "&#128514;",
            "&#128517;",
            "&#128520;",
            "&#128521;",
            "&#128523;",
            "&#128526;",
            "&#128528;",
            "&#128530;",
            "&#128545;",
            "&#128548;",
            "&#128561;"];

            var htmlFormat = [{
                "start": "<b>",
                "end": "<\/b>",
                "icon": "fa-bold"
            }, {
                "start": "<i>",
                "end": "<\/i>",
                "icon": "fa-italic"
            }, {
                "start": "<u>",
                "end": "<\/u>",
                "icon": "fa-underline"
            }, {
                "start": "<sub>",
                "end": "<\/sub>",
                "icon": "fa-subscript"
            }];

            var pSpan = $("<span></span>");
            pSpan.addClass("t-Form-inlineHelp");

            switch (type) {
                case "2":
                    $.each(htmlFormat, function (i, obj) {
                        var span = $("<span></span>");
                        span.addClass("item-toolbar");
                        span.addClass("fa");
                        span.addClass(obj.icon);
                        span.css("cursor", "pointer");
                        span.css("font-size", "1.4em");
                        span.css("line-height", "1.5em");
                        span.css("margin-right", "3px");
                        span.attr("aria-hidden", "true");
                        span.on("click", function () {
                            var markStart = $(item).prop("selectionStart");
                            var markEnd = $(item).prop("selectionEnd");
                            var itemVal = apex.item(item).getValue();
                            var markText = itemVal.substring(markStart, markEnd);

                            itemVal = itemVal.substring(0, markStart) + obj.start + markText + obj.end + itemVal.substring(markEnd, itemVal.length);

                            apex.item(item).setValue(itemVal);
                        });

                        pSpan.append(span);
                    });
                    break;
                default:
                    $.each(smileyArr, function (i, smiley) {
                        var span = $("<span></span>");
                        span.addClass("item-toolbar");
                        span.css("cursor", "pointer");
                        span.css("font-size", "1.4em");
                        span.css("line-height", "1.5em");
                        span.html(smiley);
                        span.on("click", function () {
                            var markStart = $(item).prop("selectionStart");
                            var txt = $.trim($(this).text());
                            var itemVal = apex.item(item).getValue();

                            itemVal = itemVal.substring(0, markStart) + txt + itemVal.substring(markStart, itemVal.length);

                            apex.item(item).setValue(itemVal);
                        });

                        pSpan.append(span);
                    });
            }

            var itemWrapper = $(itemInputContainer).find(".t-Form-itemWrapper");
            pSpan.insertAfter(itemWrapper);
        }

    });

}
