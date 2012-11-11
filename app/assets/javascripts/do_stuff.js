Fixit = {
    setup: function() {
//	$('.limit').limit({
//	    maxChars: 250
//	    counter: $("#counter")
//    });
	$('#request_zone').live("change", Fixit.onZoneChange);//pass selected zone
	$('#request_building').live("change", Fixit.onBuildingChange);//pass selected building
	if( $('#new_page').size()>0){
	    var building = $('#request_building').val();
	    if(building === 'Choose a Building'){
		var zone = $('#request_zone').val();
		if(building === 'Choose a Zone'){
		    
		} else {
		    Fixit.onZoneChange();
		}
	    } else {
		Fixit.onBuildingChange();
	    }
	} else {
	    
	}
	    
    },
    onZoneChange: function(){
	Fixit.getZoneInfo()
    },
    getZoneInfo: function() {
	var zone = $('#request_zone').val()
	//alert("before ajax call: zone is " + zone);
        $.ajax({type: 'GET',
                url: '/zones/get_info/'+ zone,
                timeout: 5000,
                success: Fixit.updatePartialsOnZoneChange,
                error: function(jqXHR, textStatus, errorThrown) {alert("Ajax error: " + textStatus + " | Error Thrown is " + errorThrown);}
               });
	//alert("after ajax call");
        return(false);
    },
    updatePartialsOnZoneChange: function(data){
	$('#request_building').replaceWith(data.building_partial)
	$('#request_area').replaceWith(data.area_partial)

	//$('#request_building').change(Fixit.onBuildingChange);//pass selected building
    },
    onBuildingChange: function(){
	Fixit.getBuildingInfo()
    },
    getBuildingInfo: function() {
	var building = $('#request_building').val()
	if(building === 'Choose a Building'){
	    Fixit.onZoneChange()
	} else{
	//alert("before ajax call: building is " + building);
        $.ajax({type: 'GET',
                url: '/buildings/get_info/'+ building,
                timeout: 5000,
                success: Fixit.updatePartialsOnBuildingChange,
                error: function(jqXHR, textStatus, errorThrown) {alert("Ajax error: " + textStatus + " | Error Thrown is " + errorThrown);}
               });
	}
	//alert("after ajax call");
        return(false);
    },
    updatePartialsOnBuildingChange: function(data){
	$('#request_area').replaceWith(data.area_partial);
	$("#request_zone option:contains(" + data.zone_name + ")").attr('selected', 'selected');

    }
};
$(Fixit.setup);