<#import "parts/common.ftl" as c>

<@c.page>
<div class="row">
    <div class="col">
        <a href="#" class="list-group-item list-group-item-action list-group-item-info my-3">
            Cras justo odio
        </a>
        <a href="#" class="list-group-item list-group-item-action list-group-item-info my-3">Dapibus ac facilisis in</a>
        <a href="#" class="list-group-item list-group-item-action list-group-item-info my-3">Morbi leo risus</a>
        <a href="#" class="list-group-item list-group-item-action list-group-item-info my-3">Porta ac consectetur ac</a>
        <a href="#" class="list-group-item list-group-item-action list-group-item-info my-3">Vestibulum at eros</a>
    </div>
    <div class="col-6">
        <form>
            <div class="form-group">
                <label>Добавить INPUT</label>
                <div class="form-group input-group">
                    <input type="text" name="multiple[]" class="form-control">
                    <span class="input-group-btn"><button type="button" class="btn btn-success btn-add">✚</button></span>
                </div>
            </div>
        </form>
    </div>
    <div class="col">
        <a class="btn btn-dark my-3" href="/categories/${category.categoryname}/create-mode">Create new Test</a>
    </div>
</div>

</@c.page>

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
</script>