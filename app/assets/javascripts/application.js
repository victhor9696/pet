// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets


function vermais_search(){
  $(".vermais").click(function(){
    var key = $(this).attr("key")
    if($(this).attr("value") == 1){
      $(".hiddenSubIten"+key).removeClass("hidden");
      $(".vermais"+key).html("<b>-(menos)</b>");
      $(".vermais"+key).attr("value",0);
    }else{
      $(".hiddenSubIten"+key).addClass("hidden");
      $(".vermais"+key).html("<b>+(mais)</b>");
      $(".vermais"+key).attr("value",1);
    }
  });
}

function search(){
  var attr = {};
  $.each($(".hiddentop"),function(key,value){
    if($(value).attr("value") != ""){
      attr[$(value).attr("id")] = $(value).attr("value").split("-");
    }
  });
  query_extra = "";

  var strNew = ""
  $.each(attr,function(key,value){
    console.log(value);
    strNew = strNew+"&"+key+"="+value.join(",").split(" ").join("_")
  });

  var queryString = "";
  var url = ""
  if($("#search_query").val() != ""){
    queryString = $("#search_query").val().split(" ").join("_");
    url = "/?query="+queryString+strNew;
  }else{
    url = "/?"+strNew;
  }
  window.location = url
}

function set_value_checked(){
  $.each($(".hiddentop"),function(key,value){
    $(value).attr("value","");
  });
  $.each($(".subitem:checked"),function(key,value){
    var id = $(value).attr("subitem");
    var val = $("#"+id).attr("value");
    if(val != "")
      val = "-"+val
    $("#"+id).attr("value",$(value).attr("value")+val);
  });
}

$("#search_query").keyup(function(e){
  if(e.keyCode == 13){
    search();
  }
});
