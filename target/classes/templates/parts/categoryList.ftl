<#include "security.ftl">

<div class="container">
    <div class="row">
        <div class="card-columns">
        <#list categories as category>
            <div class="card my-3">
                <#if category.filename??>
                    <img src="/img/${category.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${category.category_id}</span><br/>
                    <#--<i>#${message.tag}</i>-->
                </div>
                <div class="card-footer text-muted">
                    ${category.categoryname}
                    <#--<a href="/user-messages/${message.author.id}">${message.authorName}</a>-->
                    <#--<#if message.author.id == currentUserId>-->
                        <#--<a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">-->
                            <#--Edit-->
                        <#--</a>-->
                    <#--</#if>-->
                </div>
            </div>
        <#else>
            No message
        </#list>
        </div>
    </div>
</div>