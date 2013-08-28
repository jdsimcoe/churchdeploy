(function($) {

	$(document).ready(function() {

		// check for html5 input multiple support first
		html5Support = ("multiple" in document.createElement("input"));
		if(!html5Support){
			// console.log("Sorry, your browser doesn't support HTML5!");
			return false;
		}
		
		Symphony.Language.add({
			'Successfully added a whole slew of entries, {$total} to be exact.': false,
			'However, {$total} entries were successfully added.': false,
			'Some errors were encountered while attempting to save.': false,
			'View all Entries': false,
			'Create more?': false,
			'Sorry, but your browser is incompatible with uploading files using HTML5 (at least, with current preferences.\n Please install the latest version of Firefox, Safari or Chrome': false,
			'Start' : false,
			'Progress' : false,
			'Loaded' : false,
			'Finished' : false,
			'multiple files can be selected, use the <code>shift</code> or <code>ctrl/cmd</code> key' : false
		});

		// this should theoretically support any upload field
		fileField = $("input[type='file']");
		form = fileField.parents('form');
		urlBase = window.location.protocol + '//' + window.location.host + window.location.pathname.replace(/(.*)\/symphony\/.*/i,'$1');
		urlMuu = "/symphony/extension/massuploadutility/"
		urlAssets = urlBase + '/extensions/massuploadutility/assets';
		source = window.location.pathname.replace(/.*\/symphony\/publish\/(.*)\/new\//i,'$1');
	
		function idSafeFilename(string) {
			return string.replace(/([^\w\d_-])/gi,'-');
		};
	
		//  if there's more than one upload field, I have no idea what to do, and it's not terribly important
		if (fileField.size() == 1) {
			label = fileField.parent().parent();
			label.html(label.html().replace(/^([\w\s]+)(\<[a-z]+)/i, '$1 ('+Symphony.Language.get("multiple files can be selected, use the <code>shift</code> or <code>ctrl/cmd</code> key")+') $2'));
			fileField = $("input[type='file']");
			fileField.attr('multiple', 'true');
			fileField.parent().append(" \
				<input type='hidden' name='MUUsource' value='"+source+"' /> \
				<div id='progress_report'> \
					<div id='progress_report_name'></div> \
					<div id='progress_report_status'></div> \
					<div id='progress_report_bar_container'> \
						<div id='progress_report_bar'></div> \
						</div> \
					</div> \
				</div> \
				<div id='file_list'></div>"
			); 
		    fileField.html5_upload({
				fieldName: fileField.attr('name'),
				insert: function(string, inserts) {
					$.each(inserts, function(index, value) {
						string = string.replace(new RegExp("%7B%24" + index + "%7D", "gi"), value); 
					});
					return string;
				},
		        url: function(number) {
					// support for replacing variables
					supportedReplacements = { 'number' : number };
					string = this.insert(form.serialize(), supportedReplacements);
					return urlBase + urlMuu + '?' + string;
		        },
				autostart: false,
				autoclear: false,
				method: "post",
		        sendBoundary: window.FormData || $.browser.mozilla,
				onChange: function(event, files) {
					$("#file_list").empty();
					if (files.length <= 1)
						$("#file_list").hide();
					else if (files.length > 1) {
						$("#file_list").show();
						$.each(files, function (k,v) {
							p = "<p id='"+idSafeFilename(v.name)+"'><img src='"+urlAssets + "/images/queued.png' />"+v.name+"</p>";
							$("#file_list").append(p);						
						});
					}
				},
		    onStart: function(event, total) {
					// should never even get here, but just incase!
					if (total <= 0) {
						return false;
					}
					return true;
		    },
		    setName: function(text) {
		        $("#progress_report_name").text(text);
		    },
		    setStatus: function(text) {
		        $("#progress_report_status").text(text);
		    },
		    setProgress: function(val) {
		        $("#progress_report_bar").css('width', Math.ceil(val*100)+"%");
		    },
		    onFinishOne: function(event, response, name, number, total) {
					// change errorsInQueue to true if you want errors shown in the queue and not on the fields themselves
          // errorsInQueue = false;
					json = $.parseJSON(response);
					id = idSafeFilename(name);
					p = "<p id='"+id+"'>";
					if (json != null) {		
						css = (json.status == 'error') ? "failure" : "success";
						p += "<img src='"+urlAssets + "/images/"+css+".png' />&nbsp;" + name + "&nbsp;<small id='MUU-list' class="+css+">";
						if (json.status == "error") {
							$.each(json.errors, function(k,v) {
								  p += v + "&nbsp;";
									field = $("form div[id='field-"+k+"'] label");
									if (!field.parent().hasClass('invalid')) {
										// field.children(":first").attr("name") + " " + v;
										field.wrap("<div class=\"invalid\"></div>");
                    // field.parent().append("<p>" + v + "</p>");
									}
								}
							);
						}
						p += "</small></p>";
					}
					else {
						p += "An unknown error occurred.</p>";
					}
					$("#file_list").show();
					$('p#'+id).replaceWith(p);

		        },
				onFinish: function(total) {
					failed = $("#MUU-list.failure").size();
					total = failed + $("#MUU-list.success").size();
					success = total - failed;
					p = "<div class=\"notifier\" style=\"height:23px\"><p id=\"notice\" class=\"notice active ";
					if (failed == 0 && success > 0) {
						p += "success\">" +  Symphony.Language.get('Successfully added a whole slew of entries, {$total} to be exact.', { 'total': total });
						p += " \
							<a href='"+urlBase+"/symphony/publish/"+source+"/new'>"+Symphony.Language.get("Create more?")+"</a> \
							<a href='"+urlBase+"/symphony/publish/"+source+"'>"+Symphony.Language.get("View all Entries")+"</a>";
							// reset the form here maybe
					}
					else {
						p += "error\">" + Symphony.Language.get('Some errors were encountered while attempting to save.');
						if (success > 0)
							p += "&nbsp;" + Symphony.Language.get('However, {$total} entries were successfully added.', { 'total' : success});
						$("#file_list")
						.animate({ backgroundColor: "#eeee55", opacity: 1.0 }, 200)
				      	.animate({ backgroundColor: "transparent", opacity: 1.0}, 350);
					}
					p += "</p></div>";
					$("div.notifier").remove();
					$("#header").prepend(p);
					$('html, body').animate({ scrollTop: $("p#notice").offset().top }, 300)
				}
		   	});
			form.on('submit', function(e) {
  			fileField = $("input[type='file']");
				if (fileField.get(0).files.length > 1) {
					// remove error classes for viewability
					$("#file_list").empty();
					if ($(".invalid").size() > 0) {
						$.each($(".invalid"), function(k,v) {
							$(v).children("p").remove();
							$(v).replaceWith($(v).contents());						
						});
						setTimeout(function() {
							// this exists because it caused issues when the event would fire up before the error div's would be removed
							fileField.triggerHandler("html5_upload.start");										
						}, 100);
					}
					else {
						fileField.triggerHandler("html5_upload.start");
					}
					e.preventDefault();
					return false;
				}
			});
		}	
		else if (fileField.size() > 1) {
			// console.log("The Mass Upload Utility doesn't work with multiple upload fields.");
		}
		else {
			// console.log("No upload fields detected.");
		}
	
	});
	
})(jQuery.noConflict());

