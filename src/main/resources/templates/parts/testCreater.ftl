<form method="post" enctype="multipart/form-data">
    <div class="form-row mt-3">
        <div class="form-group col-md-6">
            <label id="output">Enter testname</label>
            <input type="text" name="testname" class="form-control" placeholder="Enter testname">
        </div>
    </div>

    <div class="cards">
        <div class="form-group inputs-group mb-3">
            <a  class="btn btn-primary" id="id" data-toggle="collapse" href="#collapseExample" role="button"
                aria-expanded="false"
                aria-controls="collapseExample">
                Question editor
            </a>
            <span class="input-group-btn"><button type="button" class="btn btn-success btn-addd">Add ✚</button></span>


            <div class="collapse" id="collapseExample">
                <div class="form-group mt-3" id="form">
                    <div class="form-group">
                        <input type="text" class="form-control${(textError??)?string('is-invalid', '')}"
                               name="question" placeholder="Enter question"/>
                    <#--<#if textError??>-->
                    <#--<div class="invalid-feedback">-->
                    <#--${textError}-->
                    <#--</div>-->
                    <#--</#if>-->
                    </div>

                    <div class="container-fluid">
                        <div class="form-group input-group mb-3">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <input type="checkbox" aria-label="Checkbox for following text input">
                                </div>
                            </div>
                            <input type="text" name="multiple[]" class="form-control"
                                   aria-label="Text input with checkbox"
                                   placeholder="Enter answer">
                            <span class="input-group-btn"><button type="button"
                                                                  class="btn btn-success btn-add">Add answer ✚</button></span>

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="file" id="customFile">
                            <label class="custom-file-label" for="customFile">Choose image</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Save test</button>
    </div>
</form>

<script>

    $(document).on('click', '.btn-add', function(event) {
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
        event.preventDefault();
        $(this).closest('.form-group').remove();
    });

    var count = 1;

    $(document).on('click', '.btn-addd', function (event) {

        var number = count++;
        //$('#output').html(function(i, val) { val = val*1+1; return val*1+1; });
        event.preventDefault();
        var field = $(this).closest('.cards');
        var field_new = field.clone();

        $(this)
                .toggleClass('btn-success')
                .toggleClass('btn-addd')
                .toggleClass('btn-danger')
                .toggleClass('btn-remove')
                .html('✖');
        field_new.insertAfter(field);

        $('#id').replaceWith('<a class="btn btn-primary" id="id'+ number+'" data-toggle="collapse" href="#collapseExample' + number + '" role="button" aria-expanded="false" aria-controls="collapseExample' + number + '">Question editor</a>');
        $('#collapseExample').replaceWith('<div class="collapse" id="collapseExample' + number + '">'+field_new.find('#form').html() + '</div>');
    });


    $(document).on('click', '.btn-remove', function (event) {
        event.preventDefault();
        $(this).closest('.form-group').remove();
    });
    ;
</script>
