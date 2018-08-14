<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>

<@c.page>
<h3>Here you can create your own test:</h3>

    <#include "parts/testCreater.ftl" />

</@c.page>

<script>
    $(document).on('click', '.btn-add', function(event) {


        $(this).closest('.cards').find('#output').val(function(i, val) { return val*1+1 });
        event.preventDefault();
        var field = $(this).closest('.form-group');
        var field_new = field.clone();
        $(this)
                .toggleClass('btn-success')
                .toggleClass('btn-add')
                .toggleClass('btn-danger')
                .toggleClass('btn-remove')
                .html('✖');
        field_new.find('input').val('');
        field_new.insertAfter(field);
    });
    $(document).on('click', '.btn-remove', function(event) {
        $(this).closest('.cards').find('#output').val(function(i, val) { return val*1-1 });
        event.preventDefault();
        $(this).closest('.form-group').remove();
    });
    var count = 1;
    $(document).on('click', '.btn-addd', function (event) {
        var number = ++count;
        $('#output3').val(function(i, val) { return number; });
        //$('#output').html(function(i, val) { val = val*1+1; return val*1+1; });
        event.preventDefault();
        var field = $(this).closest('.cards');
        var field_new = field.clone();
        $(this)
                .toggleClass('btn-success')
                .toggleClass('btn-addd')
                .toggleClass('btn-danger')
                .toggleClass('btn-remover')
                .html('✖');
        field_new.insertAfter(field);
        $('#id').replaceWith('<a class="btn btn-primary" id="id'+ number+'" data-toggle="collapse" href="#collapseExample' + number + '" role="button" aria-expanded="false" aria-controls="collapseExample' + number + '">Question editor</a>');
        $('#collapseExample').replaceWith('<div class="collapse" id="collapseExample' + number + '">'+field_new.find('#form').html() + '</div>');
        // $('#output').replaceWith('<label id="output">1</label>');
    });
    $(document).on('click', '.btn-remover', function (event) {
        var number =--count;
        $('#output3').val(function(i, val) { return number; });
        event.preventDefault();
        $(this).closest('.form-group').remove();
    });
    ;
</script>