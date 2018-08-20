<#import "parts/common.ftl" as c>

<@c.page>
<h5>Список пользователей</h5>
<table>
    <thead>
    <tr>
        <th>Имя пользователя</th>
        <th>Роль</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
        <#list  users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>,</#list></td>
                <td><a href="/user/${user.id}">изменить</a></td>
            </tr>
        </#list>
    </tbody>
</table>
</@c.page>

