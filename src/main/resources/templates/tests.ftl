<#import "parts/common.ftl" as c>

<@c.page>
<div class="row">
    <div class="col my-3">
        <#list tests as test>
            <a href="/categories/${category.category_id}/${test.test_id}" class="list-group-item list-group-item-action list-group-item-info my-3">${test.testname}</a>
            <#if test.image_path_start??>
                            <img src="/img/${test.image_path_start}" class="card-img-top">
            </#if>
        <#else>
                <h5>No tests</h5>
        </#list>
    </div>
    <div class="col-6 my-3">

    </div>
    <div class="col">
        <a class="btn btn-dark my-3" href="/categories/${category.category_id}/create-mode">Create new Test</a>
    </div>
</div>

</@c.page>