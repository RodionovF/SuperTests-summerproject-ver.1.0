<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>


<div class="row">
    <div class="сol-5">
        <div class="card my-3">
            <div class="card-header">
                <#if test.image_path_end??>
                                <img src="/img/${test.image_path_end}" class="img-thumbnail my-3">
                </#if>
                <h5>Вы ответили верно на ${numOfRightAnswers} из ${test.num_of_questions} вопросов.</h5>
            </div>
        </div>
        <div class="card-body">
            <h5>Этот тест прошли ${numOfTimesPass} раз.</h5>
            <h5>Ваш результат лучше, чем у  ${numOfTimesPass}% пользователей.</h5>
        </div>
    </div>
    <div class="сol-5">
        <a class="btn btn-primary"
           href="/categories/${category.categoryId}">
            К списку тетсов
        </a>
    </div>
</@c.page>