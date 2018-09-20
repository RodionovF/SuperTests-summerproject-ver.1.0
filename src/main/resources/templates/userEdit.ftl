<#import "parts/common.ftl" as c>

<@c.page>
<h5>Редактор пользователя</h5>

<form action="/user" method="post">
    <input type="text" class="username my-1" name="username" value="${user.username}">
    <#list roles as role>
        <div class="mt-1">
            <label>
                <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked","")}/>
                ${role}
            </label>
        </div>
    </#list>
    <input type="hidden" value="${user.userId}" name="userId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button class="btn btn-primary" type="submit">Сохранить</button>
</form>
</@c.page>
