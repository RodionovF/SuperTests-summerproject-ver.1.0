<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>


<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/categories" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by category name">
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>

    <#if isAdmin>
    <#include "parts/categoryEdit.ftl" />
    </#if>
    <#include "parts/categoryList.ftl" />

</@c.page>

