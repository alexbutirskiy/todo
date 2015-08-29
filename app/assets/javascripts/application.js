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

const KEY_CODE_ENTER = 13;
const KEY_CODE_ESC = 27;

/******************************************************************************
                              Project header
******************************************************************************/
// Enables form for project name editing
$(document).on('click', '.prj_edit_btn', function(){
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
  $(document).find('.prj_name').children().find('#project_name').hide();
  $(document).find('.prj_name').children().find('label').show();
}

// Process click inside project name form to prevent it's hidding
// $(document).on('click', function(){
//   $('.prj_name_text').click(function(){
//     return false;
//   })
// })

$(document).on('keypress', '.edit_project', function(event){
  if(event.keyCode === KEY_CODE_ENTER &&
        $(this).find('.prj_name_text').val().length === 0) {
    $(this).find('.prj_name_text').val( $(this).find('label').html() );
    alert("Project name can't be empty");
    return false;
  }
})

/******************************************************************************
                              Add task form
******************************************************************************/
// Set focus at input and clear it's value
function add_task_focus(env){
  var task_form = $(env).parents('tr').first().find('#task_name').val("")
  task_form.focus();
  task_form.addClass('new_task_form_active');
}

// restores form's default state
function add_task_restore(){
  var task_form = $(document).find('.new_task_row').find('#task_name')
    .val("Start typing here to create a task…");
  task_form.removeClass('new_task_form_active');
}

function task_name_check(env) {
  if( $(env).find('#task_name').val().length === 0 ) {
    alert("Task name can't be empty");
    return false;
  }
}

$(document).on('click', '.plus_task_btn', function(){
  add_task_focus(this);
  return false;
})

$(document).on('click', '.new_task_form', function(){
  add_task_focus(this);
  return false;
})

$(document).on('keypress', '.new_task_form', function(event){
  if(event.keyCode === KEY_CODE_ENTER) {
    return( task_name_check(this) );
  }
})

$(document).on('click', '.add_task_btn', function(){
  var form = $(this).parents('.new_task_row').find('.new_task_form');
  if( task_name_check(form) != false) {
    form.submit();
  }
  return false;
})

/******************************************************************************
                              Common
******************************************************************************/
function esc(){
  prj_edit_hide();
  add_task_restore();
}

// Process click outside to hide all forms
$(document).on('click', function(){
  esc();
})

// TODO: #main_page selector doesn't work
$(document).on('keyup', '#main_page', function(event){
  if(event.keyCode === KEY_CODE_ESC){
    esc();
  }
})