(function ($, document, window, audiojs) {

	"use strict";

	$(function () {

		$.fn.exists = function () {
			return $(this).length > 0;
		};

		$(document).ready(function () {

			audiojs.events.ready(function(){audiojs.createAll();});

			$('.downloadPopover').hover(function(){
				$(this).popover('toggle');
			});

			var hostName = window.location.hostname,
				links = $("a"),
				alertLiveCookie = $.cookie("alertLive"),
				i = 0;

			if (alertLiveCookie !== "hidden") {
				$(".alertLive").removeClass("hidden");
				$(".alertLive .close").click(function () {
					$.cookie("alertLive", "hidden", { expires: 1, path: "/" });
				});
			}

			$(".alert").alert();
			$('.carousel').carousel();

			function isPlaceholderSupported() {
		        var input = document.createElement("input");
		        return ('placeholder' in input);
		    }

		    var placeholdersupport = isPlaceholderSupported();

		    if (placeholdersupport == false) {
		        $('.search-query').val('Search');
		    }

		    $('.search-query').focus(function() {
		        if (placeholdersupport == false) {
		            if ($(this).val() == 'Search')
		                $(this).val('');
		        }
		    });

		    $('.search-query').blur(function() {
		        if (placeholdersupport == false) {
		            if($(this).val() == '')
		                $(this).val('Search');
		        }
		    });

			$(".modalLiveLink").click(function (e) {
				e.preventDefault();
				$(".modalLive").modal("show");
				return false;
			});

			$(".modalLive .close").click(function (e) {
				e.preventDefault();
				$(".modalLive").modal("hide");
				return false;
			});

			$(".modalLive").on("show", function () {
				var url = $(".modalLive .modal-body .url").html();
				$(".modalLive .modal-body .ustream-embed").html("<iframe src=\"" + url + "\" width=\"600\" height=\"363\" scrolling=\"no\" frameborder=\"0\" style=\"border: 0px none transparent;\"></iframe>");
			});

			$(".modalLive").on("hidden", function () {
				$(".modalLive .modal-body .ustream-embed").html("#");
				$(".modalLive").hide();
			});

			for (i = 0; i < links.length; i += 1) {
				if (links[i].href.indexOf(hostName) === -1) {
					links[i].setAttribute("target", "_blank");
				}
			}

			Logos.ReferenceTagging.lbsBibleVersion = "KJV";
			Logos.ReferenceTagging.lbsLinksOpenNewWindow = true;
			Logos.ReferenceTagging.lbsLogosLinkIcon = "dark";
			Logos.ReferenceTagging.lbsNoSearchTagNames = [ "cite", "h1", "h2", "h3", "h4", "h5", "h6" ];
			Logos.ReferenceTagging.lbsTargetSite = "biblia";
			Logos.ReferenceTagging.tag();
			Logos.ReferenceTagging.lbsCssOverride = true;


		  // $('.secret').raptorize({
		  //   'enterOn' : 'click', //timer, konami-code, click
		  //   'delayTime' : 1000 //time before raptor attacks on timer mode
		  // });


		});
	});
}(jQuery, document, window, audiojs));