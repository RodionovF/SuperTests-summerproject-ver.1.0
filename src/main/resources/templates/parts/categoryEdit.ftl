<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Category editor
</a>
<div class="collapse <#if category??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                       value="<#if category??>${category.categoryname}</#if>" name="categoryname" placeholder="Enter the category name" />
                <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                </#if>
            </div>
            <#--<div class="form-group">-->
                <#--<input type="text" class="form-control"-->
                       <#--value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг">-->
                <#--<#if tagError??>-->
                    <#--<div class="invalid-feedback">-->
                        <#--${tagError}-->
                    <#--</div>-->
                <#--</#if>-->
            <#--</div>-->
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose image</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if category??>${category.category_id}</#if>" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Save category</button>
            </div>
        </form>
    </div>
</div>