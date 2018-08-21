<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>

<@c.page>
<h3>Создание теста.</h3>

    <#include "parts/testCreater.ftl" />

</@c.page>

<script>
    var count = 1;

    $(document).on('click', '.btn-add', function (event) {


        $(this).closest('.cards').find('#output').val(function (i, val) {
            return val * 1 + 1
        });
        event.preventDefault();
        var field = $(this).closest('.form-group');
        var field_new = field.clone();
        $(this)
                .toggleClass('btn-success')
                .toggleClass('btn-add')
                .toggleClass('btn-danger')
                .toggleClass('btn-remove')
                .html('✖');
        field_new.insertAfter(field);
        $(this).closest('.form-group').find('#output1').replaceWith('<input type="checkbox" name="active" id="output1" value="1"\n' +
                'aria-label="Checkbox for following text input" />');
        $(this).closest('.form-group').find('#output2').val('');
    });

    $(document).on('click', '.btn-remove', function (event) {
        $(this).closest('.cards').find('#output').val(function (i, val) {
            return val * 1 - 1
        });
        event.preventDefault();
        $(this).closest('.form-group').remove();
    });

    $(document).on('click', '.btn-addd', function (event) {
        var number = ++count;
        $('#output3').val(function (i, val) {
            return number;
        });

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

        $('#id').replaceWith('<a class="btn btn-primary" id="id'+ number+'" data-toggle="collapse" href="#collapseExample' +
                number + '" role="button" aria-expanded="false" aria-controls="collapseExample' +
                number + '">Редактор вопроса</a>');
        $('#collapseExample').replaceWith('<div class="collapse" id="collapseExample' +
                number + '">' + field_new.find('#form').html() + '</div>');
        $(this).closest('.cards').find('#output').val(1);

        $('#output4').replaceWith('<div class="col-sm-8 container-fluid ml-5">' +
                '<div class="form-group input-group">' +
                '<div class="input-group-prepend">' +
                '<div class="input-group-text my-3">' +
                '<input type="checkbox" name="active" id="output1" value="1"\n' +
                'aria-label="Checkbox for following text input" />' +
                '<input type="hidden" value="0" name="active"/>' +
                '</div>' +
                '</div>' +
                '<input type="text" name="answer" id="output2" class="form-control my-3" ' +
                'aria-label="Text input with checkbox" placeholder="Enter the answer">' +
                '<span class="input-group-btn my-3"><button type="button" \n' +
                'class="btn btn-success btn-add">Добавить ответ ✚</button></span>' +
                '</div>' +
                '</div>'
        );
    });

    $(document).on('click', '.btn-remover', function (event) {
        var number = --count;
        $('#output3').val(function (i, val) {
            return number;
        });
        event.preventDefault();
        $(this).closest('.cards').remove();
    });


    $(document).on('change', '.fileUpload', function (event) {
        var filename = $(this).closest('.fileUpload').find('#uploadBtn').val().replace(/.*\\/, "");
        $(this).closest('.inputBtnSection').find("#uploadFile").val(filename);
    });

    // $(document).ready( function() {
    //     $(".fileUpload input[type=file]").change(function(){
    //         var filename = $(this).val().replace(/.*\\/, "");
    //         $("#uploadFile").val(filename);
    //     });
    // });


    // document.getElementById("uploadBtn1").onchange = function () {
    //     document.getElementById("uploadFile1").value = this.value;
    // };
    //
    // document.getElementById("uploadBtn2").onchange = function () {
    //     document.getElementById("uploadFile2").value = this.value;
    // };

</script>