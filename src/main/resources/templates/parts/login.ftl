<#include "security.ftl">

<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Имя пользователя :</label>
        <div class="col-sm-6">
            <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                   class="form-control ${(usernameError??)?string('is-invalid', '')}"
                   placeholder="User name"/>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Пароль :</label>
        <div class="col-sm-6">
            <input type="password" name="password"
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   placeholder="Password" />
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
    </div>
    <#if isRegisterForm>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Повторите пароль :</label>
            <div class="col-sm-6">
                <input type="password" name="password2"
                       class="form-control ${(password2Error??)?string('is-invalid', '')}"
                       placeholder="Retype password"/>
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">E-mail:</label
            <div class="col-sm-6">
                <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                       class="form-control ${(emailError??)?string('is-invalid', '')}"
                       placeholder="some@some.com"/>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </div>
       <div class="col-sm-6">
           <div class="g-recaptcha" data-sitekey="6LfNImYUAAAAAMXgqpg3Ph_ntB7WE4HfWgyW3VWr"></div>
            <#if captchaError??>
                <div class="alert alert-danger" role="alert">
                    ${captchaError}
                </div>
            </#if>
       </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-primary my-3" type="submit"><#if isRegisterForm>Создать<#else>Войти</#if></button>
    <div><#if !isRegisterForm><a href="/registration">Добавить нового пользователя</a></#if></div>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-primary" type="submit"><#if user??>Выйти<#else>Войти</#if></button>
</form>
</#macro>