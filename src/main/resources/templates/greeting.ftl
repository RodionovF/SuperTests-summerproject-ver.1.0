<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<div class="my-3">
    <h5>Здравствуйте, <#if user??>${name}<#else>гость</#if>!</h5>
    <div>Это развлекательное приложение служит для прохождения и создания тестов.</div>
</div>
</@c.page>

