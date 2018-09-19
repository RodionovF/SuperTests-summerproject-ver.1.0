<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

<div class="row">
    <div class="col-sm-8 my-3">
            <div class="card">
                <div class="card-header">
                     <#if test.image_path_end??>
                        <img src="/img/${test.image_path_end}" class="card-img-top">
                     </#if>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Вы ответили верно на ${numOfRightAnswers} из ${test.num_of_questions} вопросов.</h5>
                    <h5>Этот тест прошли ${numOfTimesPass} раз.</h5>
                    <h5>Ваш результат лучше, чем у ${betterThen}% пользователей.</h5>
                </div>
            </div>
    </div>

    <div class="col-sm-3 my-3">
        <a class="btn btn-primary" href="/categories/${category.categoryId}">
            К списку тестов
        </a>
    </div>
</div>

</@c.page>