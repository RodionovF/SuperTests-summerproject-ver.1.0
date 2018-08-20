<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>


<@c.page>
<div class="form-row mt-3">
    <div class="form-group col-md-6">
        <form method="get" action="/categories" class="form-inline">
            <input type="text" name="filter" class="form-control mr-3" value="${filter?ifExists}"
                   placeholder="Search by category name">
            <button type="submit" class="btn btn-primary"> Поиск</button>
        </form>
    </div>
</div>

    <#if isAdmin>
        <#include "parts/categoryEdit.ftl" />
    </#if>

    <#include "parts/categoryList.ftl" />

</@c.page>

<script>
    document.getElementById("uploadBtn").onchange = function () {
        document.getElementById("uploadFile").value = this.value;
    };
</script>
