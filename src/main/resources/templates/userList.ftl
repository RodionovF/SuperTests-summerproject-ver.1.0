<#import "parts/common.ftl" as c>

<@c.page>
<h3>Список пользователей</h3>
<table class="table table-sm">
    <thead>
    <tr>
        <th scope="col">Имя пользователя</th>
        <th scope="col">Роль</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
        <#list  users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>,</#list></td>
                <td><a href="/user/${user.userId}">изменить</a></td>
            </tr>
        </#list>
    </tbody>
</table>
</@c.page>

