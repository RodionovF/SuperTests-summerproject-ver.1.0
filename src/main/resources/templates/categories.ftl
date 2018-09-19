<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>


<@c.page>
<form method="get" action="/categories">
    <div class="form-row">
        <div class="col-sm-6">
            <div class="form-row">
                <div class="col-sm-5">
                    <input type="text" name="filter" class="form-control mt-3" value="${filter?ifExists}"
                           placeholder="Search by category name"/>
                </div>
                <div class="col-sm-6">
                    <button type="submit" class="btn btn-primary mt-3"> Поиск</button>
                </div>
            </div>
        </div>
    </div>
</form>

    <#if isAdmin>
        <#include "parts/categoryEdit.ftl" />
    </#if>

    <#include "parts/categoryList.ftl" />

</@c.page>

<script>
    $(document).on('change', '.fileUpload', function (event) {
        var filename = $(this).closest('.fileUpload').find('#uploadBtn').val().replace(/.*\\/, "");
        $(this).closest('.inputBtnSection').find("#uploadFile").val(filename);
    });
</script>

