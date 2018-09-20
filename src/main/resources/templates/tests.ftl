<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>

<@c.page>

<div class="row">
    <div class="col-sm-4 my-3">
        <#list tests as test>
            <div class="card my-3">
                <div class="card-header">
                    <#if test.image_path_start??>
                        <img class="card-img-top" src="/img/${test.image_path_start}" alt="Card image cap">
                    </#if>
                </div>
                <div class="card-body">
                    <h5 class="card-title">${test.testname}</h5>
                    <p><a href="/categories/${category.categoryId}/${test.test_id}" class="btn btn-primary"
                          role="button">Пройти</a></p>
                    <p class="card-text">
                        <div class="row">
                            <div class="col-sm-6">
                                <small class="text-muted">Тест создал ${test.author_id.username}</small>
                            </div>
                            <div class="col-sm-2">
                            </div>
                            <div class="col-sm-2">
                                 <#if test.author_id.getUserId() == currentUserId>
                                    <a class="btn btn-outline-info btn-sm" href="/categories/${category.categoryId}/tests-editing/${test.author_id.getUserId()}?test=${test.test_id}">
                                        Edit
                                    </a>
                                 </#if>
                            </div>
                        </div>
                    </p>
                </div>
            </div>
        <#else>
                <h5>No tests</h5>
        </#list>
    </div>
    <div class="col-sm-4 my-3">

    </div>
    <div class="col-sm-3 my-3">
        <#if isCreater>
            <a class="btn btn-dark" href="/categories/${category.categoryId}/create-mode">Создать новый тест</a>
        </#if>
    </div>
</div>

</@c.page>