$("#addNewIpAddress").on("click", function(){
  $("#ip-addresses").append($("#new-ip-address-form").html());
});

$("ip-addresses").on("click", ".remove-ip-address", function(e){
  e.preventDefault();
  var $this = $(this);
  $this.parent('.ip-address-group').remove();
});
