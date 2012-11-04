Fixit = {
    setup: function() { 
	$('#request_zone').focus(Fixit.onZoneChange).change(Fixit.onZoneChange);//pass selected zone
    },
    onZoneChange: function(){
	Fixit.getZoneInfo()
    },
    getZoneInfo: function() {
	var zone = $('#request_zone').val()
	//alert("before ajax call: zone is " + zone);
        $.ajax({type: 'GET',
                url: '/zones/get_buildings/'+ zone,
                timeout: 2000,
                success: Fixit.updateBuildingPartial,
                error: function(jqXHR, textStatus, errorThrown) {alert("Ajax error: " + textStatus + " | Error Thrown is " + errorThrown);}
               });
	//alert("after ajax call");
        return(false);
    },
    updateBuildingPartial: function(data){
	$('#request_building').replaceWith(data)
    }
};
$(Fixit.setup);