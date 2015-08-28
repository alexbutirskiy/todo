// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Enables form for project name editing
$(document).on('click', '.edit_btn', function(){
  $(this).parents('tr').first().find('label').hide();
  $(this).parents('tr').first().find('#project_name').show();
  $(this).parents('tr').first().find('#project_name').focus();

  // TODO: Handler is addded every time it clicks
  // Process click inside project name form to prevent it's hidding
  $(this).parents('tr').first().find('#project_name').click(function(){
    return false;
  });
  return false;
})

// Hides edit project name form
function prj_edit_hide() {
  $(document).find('.prj_name').children().find('#project_name').hide()
  $(document).find('.prj_name').children().find('label').show()
}

// Process click outside to hide all forms
$(document).on('click', function(){
    prj_edit_hide()
})

// Process click inside project name form to prevent it's hidding
// $(document).on('click', function(){
//   $('.prj_name_text').click(function(){
//     return false;
//   })
// })

$(document).on('keypress', '.edit_project', function(event){
   if(  event.keyCode === 13 &&
        $(this).find('.prj_name_text').val().length === 0) {
    $(this).find('.prj_name_text').val( $(this).find('label').html() );
    alert("Project name can't be empty");
    return false;
   }
})