<a class="btn btn-primary mt-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    <#if category??>
        Редактор категории
    <#else>
        Добавить категорию
    </#if>
</a>
<div class="collapse <#if category??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Имя категории :</label>
                <div class="col-sm-6">

                    <input type="text" class="form-control ${(categorynameError??)?string('is-invalid', '')}"
                           value="<#if category??>${category.categoryname}</#if>" name="categoryname"
                           placeholder="Enter the category name"/>
                <#if categorynameError??>
                    <div class="invalid-feedback">
                        ${categorynameError}
                    </div>
                </#if>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Изобржение :</label>
                <div class="col-sm-6">
                    <div class="inputBtnSection">
                        <input name="uploadFile" id="uploadFile" class="disableInputField"
                               placeholder="Choose File"
                               disabled="disabled"/>
                        <label class="fileUpload">
                            <input name="file" id="uploadBtn" type="file"
                                   class="upload"/>
                            <span class="uploadBtn">Выбрать файл ...</span>
                        </label>
                    </div>
                </div>
            </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <#--<input type="hidden" name="id" value="<#if category??>${category.categoryId}</#if>"/>-->
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Сохранить категорию</button>
    </div>
    </form>
</div>
</div>