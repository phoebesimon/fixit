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
                url: 'http://localhost:3000/zones/get_buildings/'+ zone,
                timeout: 2000,
                success: Fixit.updateBuildingPartial,
                error: function() { alert('Error!'); }
               });
	//alert("after ajax call");
        return(false);
    },
    updateBuildingPartial: function(data){
	$('#request_building').replaceWith(data)
    }
};
$(Fixit.setup);