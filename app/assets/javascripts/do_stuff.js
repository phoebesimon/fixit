Fixit = {
    setup: function() { 
	$('#request_zone').change(Fixit.onZoneChange);//pass selected zone
    },
    onZoneChange: function(){
	Fixit.getZoneInfo()
    },
    getZoneInfo: function() {
	alert("before ajax call");
        $.ajax({type: 'GET',
                url: 'http://localhost:3000/zones/get_buildings/Unit_1',
                timeout: 10,
                success: function(){alert('success!');},
                error: function() { alert('Error!'); }
               });
	alert("after ajax call");
        return(false);
    }
};
$(Fixit.setup);