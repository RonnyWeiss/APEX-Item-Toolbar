function itemToolbar(self, type, formatTypes, emojiiTypes) {
    "use strict";
    var scriptVersion = "2.0";

    $.each($(self.affectedElements), function (i, item) {

        // add only if it's a textare or textfield
        if ($(item).is("textarea") || $(item).attr("type") == "text") {

            var itemInputContainer = $(item).closest("div.t-Form-inputContainer");
            var stdFontSize = "1.4em";
            var itemValArr = [];
            var itemIdx = 0;
            var typeArr = type.split(":");
            var formatTypesArr = formatTypes.split(":");
            var emojiiTypesArr = emojiiTypes.split(":");
            var isFirst = true;

            var smileyStdArr = [
            "&#128513;",
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
            "&#128561;",
            "&#10084;",
            "&#10004;",
            "&#128077;",
            "&#9992;",
            "&#11088;",
            "&#10060;",
            "&#10071;",
            "&#9749;",
            "&#9742;",
            "&#128163;",
            "&#9888;",
            "&#128269;",
            "&#128198;"];

            // Filter emojii Array depending on selection
            var smileyArr = [];

            // convert emoji array to array of numbers because split make string array
            for (var i = 0; i < emojiiTypesArr.length; i++) {
                emojiiTypesArr[i] = +emojiiTypesArr[i];
            }
            for (var i = 0, len = smileyStdArr.length; i < len; i++) {
                if ($.inArray(i + 1, emojiiTypesArr) >= 0) {
                    smileyArr.push(smileyStdArr[i]);
                };
            };

            var htmlFormatStdArr = [{
                "type": "b",
                "start": "<b>",
                "end": "<\/b>",
                "icon": "fa-bold"
            }, {
                "type": "i",
                "start": "<i>",
                "end": "<\/i>",
                "icon": "fa-italic"
            }, {
                "type": "u",
                "start": "<u>",
                "end": "<\/u>",
                "icon": "fa-underline"
            }, {
                "type": "s",
                "start": "<sub>",
                "end": "<\/sub>",
                "icon": "fa-subscript"
            }];

            // Filter htmlFormat Array depending on selection
            var htmlFormatArr = [];
            for (var i = 0, len = htmlFormatStdArr.length; i < len; i++) {
                if ($.inArray(htmlFormatStdArr[i].type, formatTypes) >= 0) {
                    htmlFormatArr.push(htmlFormatStdArr[i]);
                };
            };

            var unDoReDoArr = [{
                "type": "undo",
                "icon": "fa-undo"
            }, {
                "type": "redo",
                "icon": "fa-repeat"
            }];

            // main toolbar region
            var pSpan = $("<span></span>");
            pSpan.addClass("t-Form-inlineHelp");

            /************************************************************************
             **
             ** Used to add smiley toolbar
             **
             ***********************************************************************/
            function addSmileys() {
                $.each(smileyArr, function (i, smiley) {
                    var region = $("<span></span>");
                    region.addClass("item-toolbar");
                    region.css("cursor", "pointer");
                    region.css("user-select", "none");
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
                        if (isFirst && markStart == 0) {
                            itemVal = itemVal + txt;
                        } else {
                            itemVal = itemVal.substring(0, markStart) + txt + itemVal.substring(markStart, itemVal.length);
                        }
                        apex.item(item).setValue(itemVal);
                    });

                    pSpan.append(region);
                });
            }

            /************************************************************************
             **
             ** Used to add html format toolbar
             **
             ***********************************************************************/
            function htmlFormats() {
                $.each(htmlFormatArr, function (i, obj) {
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
                        // check item selection 
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

            /************************************************************************
             **
             ** Used to add undo redo toolbar
             **
             ***********************************************************************/
            function unDoReDo() {

                // on keydown save item val state
                $(item).keydown(function () {
                    itemValArr.push(apex.item(item).getValue());
                    itemIdx = itemValArr.length;
                });

                // add toolbar with undo and redo button
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

            /************************************************************************
             **
             ** Used to add clear item toolbar
             **
             ***********************************************************************/
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

            /************************************************************************
             **
             ** Used to add placeholder between toolbars
             **
             ***********************************************************************/
            function placeHolder() {
                var region = $("<span></span>");
                region.css("margin-right", "5px");
                region.css("margin-left", "5px");
                pSpan.append(region);
            }


            /************************************************************************
             **
             ** Used to add selected toolbars
             **
             ***********************************************************************/
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

            /************************************************************************
             **
             ** Used to add toolbars to item
             **
             ***********************************************************************/
            var itemWrapper = $(itemInputContainer).find(".t-Form-itemWrapper");
            pSpan.insertAfter(itemWrapper);
        }

    });

}
