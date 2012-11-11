Fixit = {
    setup: function() {
//	$('.limit').limit({
//	    maxChars: 250
//	    counter: $("#counter")
//    });
	$('#request_zone').live("change", Fixit.onZoneChange);//pass selected zone
	$('#request_building').live("change", Fixit.onBuildingChange);//pass selected building
    },
    onZoneChange: function(){
	Fixit.getZoneInfo()
    },
    getZoneInfo: function() {
	var zone = $('#request_zone').val()
	//alert("before ajax call: zone is " + zone);
        $.ajax({type: 'GET',
                url: '/zones/get_buildings/'+ zone,
                timeout: 5000,
                success: Fixit.updateBuildingPartial,
                error: function(jqXHR, textStatus, errorThrown) {alert("Ajax error: " + textStatus + " | Error Thrown is " + errorThrown);}
               });
	//alert("after ajax call");
        return(false);
    },
    updateBuildingPartial: function(data){
	$('#request_building').replaceWith(data)
	//$('#request_building').change(Fixit.onBuildingChange);//pass selected building
    },
    onBuildingChange: function(){
	Fixit.getBuildingInfo()
    },
    getBuildingInfo: function() {
	var building = $('#request_building').val()
	//alert("before ajax call: building is " + building);
        $.ajax({type: 'GET',
                url: '/buildings/get_areas/'+ building,
                timeout: 5000,
                success: Fixit.updateAreaPartial,
                error: function(jqXHR, textStatus, errorThrown) {alert("Ajax error: " + textStatus + " | Error Thrown is " + errorThrown);}
               });
	//alert("after ajax call");
        return(false);
    },
    updateAreaPartial: function(data){
	$('#request_area').replaceWith(data)
    }    
};
$(Fixit.setup);