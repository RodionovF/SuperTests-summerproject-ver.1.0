<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

<h5>Здравствуйте, <#if user??>${name}<#else>гость</#if>!</h5>
<div>Это развлекательное приложение служит для прохождения и создания тестов.</div>
</@c.page>

