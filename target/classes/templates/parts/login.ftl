<#include "security.ftl">

<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row my-3">
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
            <input type="password" name="password" id="password"
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   placeholder="Password" onkeyup="doAjax()"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
            <#if isRegisterForm>
                <#if strength??>
                        <input type="hidden" id="strengthValue1" value="${strength}"/>
                </#if>
                <#if color??>
                        <input type="hidden" id="color" value="${color}"/>
                </#if>
                    <input type="text" style="float: right;" readonly class="form-control-plaintext" id="strengthValue"
                           name="num_of_questions"/>

                    <script type="text/javascript">
                        function doAjax() {
                            $.ajax({
                                url: 'registration',
                                type: 'GET',
                                data: ({password: $('#password').val()}),
                                success: function (data) {
                                    var power = $(data).find('#strengthValue1').val();
                                    var color = $(data).find('#color').val();

                                    $('#strengthValue').replaceWith('<input type="text" style="float: right; color:' + color
                                            + ';" readonly class="form-control-plaintext" id="strengthValue"'
                                            + 'name="num_of_questions" value="' + power + '">');
                                    // $('#strengthValue').val($(data).find('#strengthValue1').val());
                                }
                            })
                        }11
                    </script>
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
            <label class="col-sm-2 col-form-label">E-mail:</label>
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
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-primary" type="submit"><#if user??>Выйти<#else>Войти</#if></button>
</form>
</#macro>