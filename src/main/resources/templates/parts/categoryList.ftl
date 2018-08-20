<#include "security.ftl">

<div class="container">
    <div class="row">
        <div class="card-columns">
        <#list categories as category>
            <div class="card my-3">
                <#if category.filename??>
                    <img src="/img/${category.filename}" class="card-img-top">
                </#if>
            <#--<div class="m-2">-->
            <#--<span>${category.categoryId}</span><br/>-->
            <#--</div>-->
                <div class="card-footer text-muted">
                        <a class="btn btn-primary" href="/categories/${category.categoryId}">
                            ${category.categoryname}
                        </a>
                        <#if isAdmin>
                            <a class="btn btn-primary"
                               href="/edit-category/${category.categoryId}?сategory=${category.categoryId}">
                                Редактировать
                            </a>
                        </#if>
                </div>
            </div>
        <#else>
            No category
        </#list>
        </div>
    </div>
</div>