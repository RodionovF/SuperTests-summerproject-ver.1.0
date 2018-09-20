<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-sm navbar-light bg-light sticky-top" id="bar">
    <a class="navbar-brand" href="/">SuperTests</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Главная</a>
            </li>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/categories">Категории</a>
                </li>
            </#if>
            <#if isAdmin>
            <#--<li class="nav-item">-->
            <#--<a class="nav-link" href="/categories/">My Stats</a>-->
            <#--</li>-->
                <li class="nav-item">
                    <a class="nav-link" href="/user">Список пользователей</a>
                </li>
            </#if>
            <#if user??>
            <li class="nav-item">
                <a class="nav-link" href="/user/profile">Профиль</a>
            </li>
            </#if>
        </ul>

        <div class="navbar-text mr-3"><#if user??>${name}<#else>Пожалуйста, войдите</#if></div>
        <@l.logout />
    </div>
</nav>
