<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div class="my-3"><h5>Добавление нового пользователя</h5></div>
    <#--${message?ifExists}-->
    <@l.login "/registration" true/>
</@c.page>
