$('.servers').ready(function(){

  //dynamic form for IP addresses
  $("#addIpAddress").on("click", function(){
    var form = set_unique_id($("#new-ip-address-form"));
    $("#ip-addresses").append(form.html());
  });

  $("#ip-addresses").on("click", ".remove-ip-address", function(e){
    e.preventDefault();
    var $this = $(this);
    $this.parent().parent('.ip-address-group').remove();
  });

  //dynamic form for Accounts
  $("#addAccount").on("click", function(){
    var form = set_unique_id($("#new-account-form"));
    $("#accounts").append(form.html());
  });

  $("#accounts").on("click", ".remove-account", function(e){
    e.preventDefault();
    var $this = $(this);
    $this.parent().parent('.account-group').remove();
  });
})

function set_unique_id(form){
  var uniqueId = new Date().getTime();
  form.find('label').attr('for', function(index, old) {
    return old + '-' + uniqueId;
  })
  form.find('input').attr('id', function(index, old) {
    return old + '-' + uniqueId;
  })
  return form;
}
