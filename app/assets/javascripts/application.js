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
  esc();
  $(this).parents('tr').first().find('p').hide();
  $(this).parents('tr').first().find('#project_name').show();
  var inp = $(this).parents('tr').first().find('#project_name').focus();
  inp.val( inp.val() );       //set cursor to the end of string

  // TODO: Handler is addded every time it clicks
  // Process click inside project name form to prevent it's hidding
  $(this).parents('tr').first().find('#project_name').click(function(){
    return false;
  });
  return false;
})

// Hides edit project name form
function prj_edit_hide() {
  var prj = $(document).find('.prj_name').children();
  $.each(prj, function() {
    var inp = $(this).find('#project_name').hide();
    var title = $(this).find('p').show();
    inp.val(title.html());    // restores input value
  })
}

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
var task_name_not_ready = true;  //uses to prevent undefined task name create
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
  task_name_not_ready = true;
}

function task_name_check(env) {
  if( $(env).find('#task_name').val().length === 0 ) {
    alert("Task name can't be empty");
    return false;
  }
}

$(document).on('click', '.plus_task_btn', function() {
  esc();
  add_task_focus(this);
  return false;
})

$(document).on('click', '.new_task_form', function() {
  esc();
  add_task_focus(this);
  return false;
})

$(document).on('keypress', '.new_task_form', function(event) {
  task_name_not_ready = false;
  if(event.keyCode === KEY_CODE_ENTER) {
    return( task_name_check(this) );
  }
})

$(document).on('click', '.add_task_btn', function(){
  var form = $(this).parents('.new_task_row').find('.new_task_form');
  if( task_name_not_ready === false && task_name_check(form) != false) {
    form.submit();
  }
  add_task_restore();
  return false;
})

/******************************************************************************
                              Task edit
******************************************************************************/
function edit_task_restore() {
  var task_form = $(document).find('.task_form').find('#task_name');
  task_form.prop('disabled', true);
  task_form.removeClass('task_form_active');
}

function task_form_update(env) {
  var task_form = $(env).parents('tr').first().find('#task_name');
  if( env.checked ) {
    task_form.addClass('task_form_completed');
  } else {
    task_form.removeClass('task_form_completed');
  }
}

$(document).on('click', '.task_checkbox', function(){
  task_form_update(this);
  $(this).parents().first().submit();
})

$(document).on('click', '.edit_task_btn', function(){
  var task_form = $(this).parents('tr').first().find('#task_name');
  task_form.prop('disabled', false);
  task_form.focus();
  task_form.val( task_form.val() );       //set cursor to the end of string
  task_form.addClass('task_form_active');
  return false;
})

$(document).on('click', '.prio_task_btn', function(){

  return false;
})

/******************************************************************************
                              Common
******************************************************************************/
function esc(){
  prj_edit_hide();
  add_task_restore();
  edit_task_restore();
}

// Process click outside to hide all forms
$(document).on('click', function(){
  esc();
})

// FIX: #main_page selector doesn't work
$(document).on('keyup', '#main_page', function(event){
  if(event.keyCode === KEY_CODE_ESC){
    esc();
  }
})