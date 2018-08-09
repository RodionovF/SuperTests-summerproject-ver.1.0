<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<h5>Hello, <#if user??>${name}<#else>guest</#if>!</h5>
<div>This is just an application with all kinds of tests.</div>
</@c.page>