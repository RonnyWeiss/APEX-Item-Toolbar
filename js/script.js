function itemToolbar(self, type) {
    "use strict";
    var scriptVersion = "1.1";

    $.each($(self.affectedElements), function (i, item) {

        if ($(item).is("textarea") || $(item).attr("type") == "text") {

            var itemInputContainer = $(item).closest("div.t-Form-inputContainer");
            var stdFontSize = "1.4em";
            var itemValArr = [];
            var itemIdx = 0;
            var typeArr = type.split(":");

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

            var unDoReDoArr = [{
                "type": "undo",
                "icon": "fa-undo"
            }, {
                "type": "redo",
                "icon": "fa-repeat"
            }];

            var pSpan = $("<span></span>");
            pSpan.addClass("t-Form-inlineHelp");

            function addSmileys() {
                $.each(smileyArr, function (i, smiley) {
                    var region = $("<span></span>");
                    region.addClass("item-toolbar");
                    region.css("cursor", "pointer");
                    region.css("font-size", stdFontSize);
                    region.css("line-height", "1.5em");
                    region.css("margin-right", "2px");
                    region.html(smiley);
                    region.on("click", function () {
                        var markStart = $(item).prop("selectionStart");
                        var txt = $.trim($(this).text());
                        var itemVal = apex.item(item).getValue();

                        if ($.inArray("undoredo", typeArr) >= 0) {
                            itemValArr.push(itemVal);
                            itemIdx = itemValArr.length;
                        }

                        itemVal = itemVal.substring(0, markStart) + txt + itemVal.substring(markStart, itemVal.length);
                        apex.item(item).setValue(itemVal);
                    });

                    pSpan.append(region);
                });
            }

            function htmlFormats() {
                $.each(htmlFormat, function (i, obj) {
                    var region = $("<span></span>");
                    region.addClass("item-toolbar");
                    region.addClass("fa");
                    region.addClass(obj.icon);
                    region.css("cursor", "pointer");
                    region.css("font-size", stdFontSize);
                    region.css("line-height", "1.6em");
                    region.css("margin-right", "2px");
                    region.attr("aria-hidden", "true");
                    region.on("click", function () {
                        var markStart = $(item).prop("selectionStart");
                        var markEnd = $(item).prop("selectionEnd");
                        var itemVal = apex.item(item).getValue();

                        if ($.inArray("undoredo", typeArr) >= 0) {
                            itemValArr.push(itemVal);
                            itemIdx = itemValArr.length;
                        }

                        var markText = itemVal.substring(markStart, markEnd);

                        itemVal = itemVal.substring(0, markStart) + obj.start + markText + obj.end + itemVal.substring(markEnd, itemVal.length);
                        apex.item(item).setValue(itemVal);
                    });

                    pSpan.append(region);
                });
            }

            function unDoReDo() {

                $(item).keydown(function () {
                    itemValArr.push(apex.item(item).getValue());
                    itemIdx = itemValArr.length;
                });

                $.each(unDoReDoArr, function (i, obj) {
                    var region = $("<span></span>");
                    region.addClass("item-toolbar");
                    region.addClass("fa");
                    region.addClass(obj.icon);
                    region.css("cursor", "pointer");
                    region.css("font-size", stdFontSize);
                    region.css("line-height", "1.6em");
                    region.css("margin-right", "2px");
                    region.attr("aria-hidden", "true");
                    region.on("click", function () {
                        if (obj.type == "undo") {
                            if (itemIdx > 0) {
                                if (itemIdx == itemValArr.length && apex.item(item).getValue() != itemValArr[itemValArr.length - 1]) {
                                    itemValArr.push(apex.item(item).getValue());
                                }
                                itemIdx--;
                                apex.item(item).setValue(itemValArr[itemIdx]);


                            }
                        } else {
                            if (itemIdx < itemValArr.length - 1) {
                                itemIdx++;
                                apex.item(item).setValue(itemValArr[itemIdx]);
                            }
                        }
                    });

                    pSpan.append(region);

                });

            }

            function clearItem() {

                var region = $("<span></span>");
                region.addClass("item-toolbar");
                region.addClass("fa");
                region.addClass("fa-remove");
                region.css("cursor", "pointer");
                region.css("font-size", stdFontSize);
                region.css("line-height", "1.6em");
                region.css("margin-right", "2px");
                region.attr("aria-hidden", "true");
                region.on("click", function () {
                    if ($.inArray("undoredo", typeArr) >= 0) {
                        itemValArr.push(apex.item(item).getValue());
                        itemIdx = itemValArr.length;
                    }
                    apex.item(item).setValue("");
                });

                pSpan.append(region);

            }

            function placeHolder() {
                var region = $("<span></span>");
                region.css("margin-right", "5px");
                region.css("margin-left", "5px");
                pSpan.append(region);
            }

            $.each(typeArr, function (i, obj) {
                if (obj == "undoredo") {
                    unDoReDo();
                    if (typeArr.length > 1) {
                        placeHolder();
                    }
                }
                if (obj == "clear") {
                    clearItem();
                    if (typeArr.length > 1) {
                        placeHolder();
                    }
                }
                if (obj == "emoji") {
                    addSmileys();
                    if (typeArr.length > 1) {
                        placeHolder();
                    }
                }
                if (obj == "format") {
                    htmlFormats();
                }
            });

            var itemWrapper = $(itemInputContainer).find(".t-Form-itemWrapper");
            pSpan.insertAfter(itemWrapper);
        }

    });

}
