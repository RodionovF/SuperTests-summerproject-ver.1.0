<#import "parts/common.ftl" as c>

<@c.page>
<div class="row">
    <div class="col-4">
        <#list tests as test>

            <div class="card my-3">
                <#if test.image_path_start??>
                    <img class="card-img-top" src="/img/${test.image_path_start}" alt="Card image cap">
                </#if>
                <div class="card-body">
                    <h5 class="card-title">${test.testname}</h5>
                    <p class="card-text"> <p><a href="/categories/${category.categoryId}/${test.test_id}" class="btn btn-primary mx-1" role="button">Пройти</a></p>
                    <p class="card-text">
                        <small class="text-muted mx-1">Тест создал ${test.author_id.username}</small>
                    </p>
                </div>
            </div>

        <#else>
                <h5>No tests</h5>
        </#list>
    </div>
    <div class="col-4">

    </div>
    <div class="col-3">
        <a class="btn btn-dark my-3" href="/categories/${category.categoryId}/create-mode">Создать новый тест</a>
    </div>
</div>

</@c.page>