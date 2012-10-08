var multiselectstyles = {
	classesOnly : true, 
    pseudoSelect : 'custom-select-box', 
    selected : 'custom-select',
    unselected : 'custom-unselect',
    disabled : 'custom-disabled',
    optgroup : 'custom-optgroup',
    optgroupLabel : 'custom-optgroup-label'
};

jQuery(function(){
	var $ = jQuery;
	
	if($("a.collapser").length == 0)
	{
		// Make instances collapsable:
		$("li.instance").each(function(){
			var instance = $(this);
			var pos;
			var label = $("input[name$='[label]']", this).attr("value");
			$("h4", this).append(" <em>(" + label + ")</em>");
			$("h4 em", this).hide();
			
			$("h4", this).mousedown(function(e){
				pos = e.clientY;
			}).mouseup(function(e){
				// Only toggle if there wasn't detected a move:
				// A move is detected by checking the mouse Y-position:
				if(Math.abs(e.clientY - pos) < 25)
				{
					$("div.content", instance).toggle();
					$("h4 em", instance).toggle();
				}
			});
		});
		
		// Add links to the header:
		$("ol#fields-duplicator").prev().append(' - <a href="#" class="collapse-all">Collapse all</a> / <a href="#" class="expand-all">Expand all</a>');
		$("h3.label a.collapse-all").click(function(){
			$("li.instance").each(function(){
				$("h4 em", this).show();
				$("div.content", this).hide();
			}); 
			return false;
		});
		$("h3.label a.expand-all").click(function(){
			$("li.instance").each(function(){
				$("h4 em", this).hide();
				$("div.content", this).show();
			}); 
			return false;
		});
	}
	
	// Multiselectbox:
	$("select[multiple='multiple']").simpleMultiSelect(multiselectstyles);
	// On the datasource editor page, re-initialize the multiselect to checkbox when another source is selected:
	$("select[name='fields[source]']").change(function(){
		if(jQuery('select').length){
			$("div.custom-select-box").remove();
			$("select[multiple='multiple']").simpleMultiSelect(multiselectstyles);
			checkMultiSelectBoxHeight();
		}
	});
	// Check the length:
	checkMultiSelectBoxHeight();
	
	// Group components:
	$("ul#components>li").each(function(){
		// Make groups:
		var groups = {"Uncategorized": []};
		$("ul>li a", this).each(function(){
			// console.log($(this).parent().html());
			// Split the name by using the colon:
			var a = $(this).text().split(':');
			if(a.length == 1)
			{
				// Uncategorized:
				groups.Uncategorized.push($(this).parent().html());
			} else {
				// Categorized:
				if(groups[a[0]] == undefined)
				{
					groups[a[0]] = [];
				}
				groups[a[0]].push($(this).parent().html());
			}
			$(this).remove();
		});
		
		for(var key in groups)
		{
			$(this).append('<h4>' + key + ' - <a href="#" class="collapse">Collapse</a><a href="#" class="expand">Expand</a></h4>');
			html = '<ul class="items">';
			for(i=0; i<groups[key].length; i++)
			{
				link = groups[key][i];
				html += '<li>' + link + '</li>';
			}
			html += '</ul>';
			$(this).append(html);
		}
		// Make collapsable:
		$("a.expand", this).hide();
		$("a.collapse", this).click(function(){
			$(this).parent().next().hide();
			$(this).hide();
			$("a.expand", $(this).parent()).show();
			return false;
		});
		$("a.expand", this).click(function(){
			$(this).parent().next().show();
			$(this).hide();
			$("a.collapse", $(this).parent()).show();
			return false;
		});
		// Collapse / expand all:
		$("h3", this).append(' - <a href="#" class="collapse-all">Collapse all</a> / <a href="#" class="expand-all">Expand all</a>');
		$("h3 a.collapse-all", this).click(function(){
			$("ul.items", $(this).parent().parent()).hide();
			$("h4 a.collapse").hide();
			$("h4 a.expand").show();
			return false;
		});
		$("h3 a.expand-all", this).click(function(){
			$("ul.items", $(this).parent().parent()).show();
			$("h4 a.collapse").show();
			$("h4 a.expand").hide();
			return false;
		});
	});
});

function checkMultiSelectBoxHeight()
{
	jQuery("div.custom-select-box").each(function(){
		var l = jQuery("div", this).length;
		if(l < 10)
		{
			jQuery(this).height(l * 20);
		}
	});	
}
