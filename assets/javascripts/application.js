function addDefaultMember() {
  var childrens = $('.default_members').children();
  var start = childrens.length + 1;
  createNewDiv(start);
}


function createNewDiv(id) {
  var new_div = $('#settings_template').clone();
  new_div.attr('id', new_div.attr('id').replace('template', id));

  var default_group_label = $(new_div).find('label.default_group');
  default_group_label.each(function(index, element){
    $(element).text($(element).html().replace('%{id}', ''));
  });

  var group_select = $(new_div).find('select');
  group_select.attr('id', group_select.attr('id').replace('template', id));
  group_select.attr('name', group_select.attr('name').replace('template', id));

  var default_role_label = $(new_div).find('label.default_role');
  default_role_label.each(function(index, element){
    $(element).text($(element).html().replace('%{id}', ''));
  });

  var role_labels = $(new_div).find('label.role');
  role_labels.each(function(index, element){
    $(element).attr('for', $(element).attr('for').replace('template', id));
  });

  var role_checkboxes = $(new_div).find('[type=checkbox]');
  role_checkboxes.each(function(index, element){
    $(element).attr('id', $(element).attr('id').replace('template', id));
    $(element).attr('name', $(element).attr('name').replace('template', id));
  });

  $('.default_members').append(new_div);
  new_div.show();
}


function deleteDefaultMember(element) {
  $(element).remove();
}
