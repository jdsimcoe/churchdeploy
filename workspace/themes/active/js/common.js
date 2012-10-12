
(function($, document, window, audiojs) {
  "use strict";
  return $(function() {
    $.fn.exists = function() {
      return $(this).length > 0;
    };
    return $(document).ready(function() {
      var alertLiveCookie, hostName, i, isPlaceholderSupported, links, placeholdersupport, _results;
      isPlaceholderSupported = function() {
        var input;
        input = document.createElement("input");
        return "placeholder" in input;
      };
      audiojs.events.ready(function() {
        return audiojs.createAll();
      });
      $(".downloadPopover").hover(function() {
        return $(this).popover("toggle");
      });
      hostName = window.location.hostname;
      links = $("a");
      alertLiveCookie = $.cookie("alertLive");
      i = 0;
      if (alertLiveCookie !== "hidden") {
        $(".alertLive").removeClass("hidden");
        $(".alertLive .close").click(function() {
          return $.cookie("alertLive", "hidden", {
            expires: 1,
            path: "/"
          });
        });
      }
      $(".alert").alert();
      $(".carousel").carousel();
      placeholdersupport = isPlaceholderSupported();
      if (placeholdersupport === false) {
        $(".search-query").val("Search");
      }
      $(".search-query").focus(function() {
        if (placeholdersupport === false ? $(this).val() === "Search" : void 0) {
          return $(this).val("");
        }
      });
      $(".search-query").blur(function() {
        if (placeholdersupport === false ? $(this).val() === "" : void 0) {
          return $(this).val("Search");
        }
      });
      $(".modalLiveLink").click(function(e) {
        e.preventDefault();
        $(".modalLive").modal("show");
        return false;
      });
      $(".modalLive .close").click(function(e) {
        e.preventDefault();
        $(".modalLive").modal("hide");
        return false;
      });
      $(".modalLive").on("show", function() {
        var url;
        url = $(".modalLive .modal-body .url").html();
        return $(".modalLive .modal-body .ustream-embed").html("<iframe src=\"" + url + "\" width=\"600\" height=\"363\" scrolling=\"no\" frameborder=\"0\" style=\"border: 0px none transparent;\"></iframe>");
      });
      $(".modalLive").on("hidden", function() {
        $(".modalLive .modal-body .ustream-embed").html("#");
        return $(".modalLive").hide();
      });
      i = 0;
      _results = [];
      while (i < links.length) {
        if (links[i].href.indexOf(hostName) === -1) {
          links[i].setAttribute("target", "_blank");
        }
        _results.push(i += 1);
      }
      return _results;
    });
  });
})(jQuery, document, window, audiojs);
